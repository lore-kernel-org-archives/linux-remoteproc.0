Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8ECBC433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Mar 2021 21:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE22461976
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Mar 2021 21:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhCSVtt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 19 Mar 2021 17:49:49 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:35788 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhCSVtZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 19 Mar 2021 17:49:25 -0400
Received: by mail-io1-f45.google.com with SMTP id v3so7625971ioq.2;
        Fri, 19 Mar 2021 14:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=DdFpA8RCuNet19LbBIUzBDaOeIQrmYimvT3B6l6LMdM=;
        b=f0+/HWtjgNISsUDyZbHMSHDi2llsVsCkLqbsGk64u1bfCAtQvojuCXl4sDoZ4nZvQd
         bSJ+fbtMpIbzcLgkVik5jdD1rVzsJesfKQMq1ARo/TlPn3TbvjxXLF50bJitgORGN2Xj
         INLKdRrv74cuBjlJ0ImkcItdaMDKeUo8jyd7dUZ7W/0J7rwewKqLfccIvvshDrP5cDhb
         We15qtbOPjKtlgTIhgVAac2ncipaPSHzhkIutP9+SilDthD0jv+HPWz/+Td06Y3SIMgg
         jctcpBz0YAvh55WJAaDiiUOuDk/ODnQtu8c9Jqv82JEB8zSBCBZtbdZsHyh6XR6uK7pv
         YpMQ==
X-Gm-Message-State: AOAM530zQnSDLHHYmtlBI8Bua95pwI4mu0aBMvCTenzvMnH63RjiNwz6
        UhqEHjvLJerz2RJQuPJVcegRSEswXw==
X-Google-Smtp-Source: ABdhPJz8Qcg5u41fjcWJKrDLCvbUbZw/JCtRUZ8UWObSJSHQ7Pmnal/cQAkn0JIQ6hNFqKiFD056Zg==
X-Received: by 2002:a05:6602:2d95:: with SMTP id k21mr4205797iow.123.1616190564451;
        Fri, 19 Mar 2021 14:49:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j3sm3048432ila.58.2021.03.19.14.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 14:49:23 -0700 (PDT)
Received: (nullmailer pid 1647636 invoked by uid 1000);
        Fri, 19 Mar 2021 21:49:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        devicetree@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>
In-Reply-To: <20210318145923.31936-2-arnaud.pouliquen@foss.st.com>
References: <20210318145923.31936-1-arnaud.pouliquen@foss.st.com> <20210318145923.31936-2-arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for detach
Date:   Fri, 19 Mar 2021 15:49:12 -0600
Message-Id: <1616190552.569417.1647635.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 18 Mar 2021 15:59:22 +0100, Arnaud Pouliquen wrote:
> Add the "detach" mailbox item, that allows to define a mailbox to
> send a IPCC signal to the remote processor on remoteproc detach action.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml:68:8: [error] syntax error: expected <block end>, but found '<block sequence start>' (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 852, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.parser.ParserError: while parsing a block collection
  in "<unicode string>", line 54, column 7
did not find expected '-' indicator
  in "<unicode string>", line 68, column 8
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml:  while parsing a block collection
  in "<unicode string>", line 54, column 7
did not find expected '-' indicator
  in "<unicode string>", line 68, column 8
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1455311

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

