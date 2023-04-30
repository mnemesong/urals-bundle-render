package urals.web;

import sys.io.File;

/**
    Merging files content into one text
**/
function mergeFilesContent(paths: Array<String>): String {
    return paths
        .map(p -> File.getContent(p))
        .join("\n\n");    
}

private typedef LinkConfig = {
    ?charset: String,
    ?isAlternate: Bool,
    ?media: String,
    ?type: String
}

/**
    Creates <link> tag html
**/
function printLinkTagHtml(href: String, ?config: LinkConfig): String {
    var relBlock = ((config == null) 
        || (config.isAlternate == null) 
        || (config.isAlternate == false))
        ? ' rel="stylesheet"'
        : ' rel="alternate"';
    var charsetBlock = ((config == null) || (config.charset == null))
            ? ''
            : ' charset="${config.charset}"';
    var mediaBlock = ((config == null) || (config.media == null))
        ? ''
        : ' media="${config.media}"';
    var typeBlock = ((config == null) || (config.type == null))
        ? ''
        : ' type="${config.type}"';
    return '<link href="${href}"' + charsetBlock + mediaBlock + relBlock 
        + typeBlock + '>';
}

private typedef StyleConfig = {
    ?media: String,
    ?type: String
}

/**
    Creates <style> tag html
**/
function printStyleTagHtml(text: String, ?config: StyleConfig): String {
    var mediaBlock = ((config == null) || (config.media == null))
        ? ''
        : ' media="${config.media}"';
    var typeBlock = ((config == null) || (config.type == null))
        ? ''
        : ' type="${config.type}"';
    return '<style${mediaBlock}${typeBlock}>${text}</style>';
}

private typedef ScriptConfig = {
    ?async: Bool,
    ?defer: Bool,
    ?language: String,
    ?type: String
}

private typedef ScriptContent = {
    ?src: String,
    content: String
}

/**
    Creates <script> tag html
**/
function printScriptTagHtml(script: ScriptContent, ?config: ScriptConfig): String {
    var asyncBlock = ((config == null) 
        || (config.async == null)
        || (config.async == false))
        ? ''
        : ' async';
    var deferBlock = ((config == null)
        || (config.defer == null)
        || (config.defer == false))
        ? ''
        : ' defer';
    var languageBlock = ((config == null) || (config.language == null))
        ? ''
        : ' language="${config.language}"';
    var typeBlock = ((config == null) || (config.type == null))
        ? ''
        : ' type="${config.type}"';
    var srcBlock = (script.src == null)
        ? ''
        : ' src="${script.src}"';
    return '<script' + srcBlock + languageBlock + typeBlock + asyncBlock 
        + deferBlock +'>' + script.content + '</script>';
}