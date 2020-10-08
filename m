Return-Path: <SRS0=dp89=DP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3BBC43457
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 20:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B74F2223F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 20:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YoiXBLYa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbgJHUy0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Oct 2020 16:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730739AbgJHUyZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Oct 2020 16:54:25 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD4AC0613D4
        for <linux-remoteproc@vger.kernel.org>; Thu,  8 Oct 2020 13:54:25 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u8so8165649lff.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Oct 2020 13:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tocO/B9Lq6+1kVJFUNhSCxjxnRpjafNIdcN4JRNBVbc=;
        b=YoiXBLYaxbs0qCVBRDnMH27sFMKBPT5ra2QPLTUzuzpkCRDid+wTU6iVsny55UyX+z
         ZSwVBRBUgbSb+p2PA7gjjgwvp42yXzz7v/C5ADQpzZveA7GHjZtKBaRQttK/Q2RZNYy5
         aJ15KMFFzwBqNJzmYvat5bZCmRhbrfkFDl+PB6T+MWyKEh3k1JL0mBRnMfAkRNnmKWZ0
         CAXplWyqxfYga8bbMW54N/Um8CEACrqaH2k1qvUc70gGyhXOgZmgo1uflLsUJVzbSNH9
         Jl+HukaQt0GcYCsSxUq30pCijnPFjCZzqiavpJge8g6AIxRSxYz7XxX2dJJdHC/2xqgn
         WNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tocO/B9Lq6+1kVJFUNhSCxjxnRpjafNIdcN4JRNBVbc=;
        b=oxfUP1OUBMWzd9ZMeHZFXaRVKgapqsZL4Z/hyIZfWkgI9tsKzaXaQ2IfyDuEAs8BJs
         7btMyZ8PGrxtBU7exodjsQ4qTi6Qz2gBDBpj+WiAPgYxX+UrawBuMl02+2nim0vLbXe1
         NL9znlnxcfnGFykTiWSBx+pkqX9ic6bNtZoeTOoJRGokOLE458CqryZ43J+AxQBauLIz
         yxXaqf8wwUkfNMYklmsyuvQREuLyIAy8jPrNpOIGYf2a+hfQLeAlyIxQ1RsRNXnbVXZn
         Qbtx/Whj7rgylvnhoOcoewSSYgOFuN54pz4ZU4IS0yWRgma8iSDOiXu2Bfqo4g9ee+mh
         Pkag==
X-Gm-Message-State: AOAM5333Besxq9KbXncJ9YgOaHNRAfwTzjIkijXsNzV9DFffA8dGzvbm
        +KHr7GmeCrHBrezoJJh41ZOvk+jSzT77PMRL3JI9nA==
X-Google-Smtp-Source: ABdhPJxcWRYqQbXfXwqugkMw/o/Tb2QvJ1KChfARrTOjotSF8GKqXHAadrzMf4OTQL6OgJgT6Np7m8icj77pU9yHJo8=
X-Received: by 2002:a19:824f:: with SMTP id e76mr1878046lfd.572.1602190463699;
 Thu, 08 Oct 2020 13:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201005160614.3749-1-ben.levinsky@xilinx.com>
 <20201005160614.3749-5-ben.levinsky@xilinx.com> <CACRpkdb1x=U28VWZGDJh6gJSzaqeNxx0m+WtnUQZJKGvXjvXYQ@mail.gmail.com>
 <BYAPR02MB4407F9D8A60519D00F317D27B50B0@BYAPR02MB4407.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4407F9D8A60519D00F317D27B50B0@BYAPR02MB4407.namprd02.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Oct 2020 22:54:12 +0200
Message-ID: <CACRpkdb2AamnF9h_FfFDhTBMz7W-gob98OOzrHOiovyoiBPWRw@mail.gmail.com>
Subject: Re: [PATCH v18 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Stefano Stabellini <stefanos@xilinx.com>,
        "Ed T. Mooring" <emooring@xilinx.com>,
        "sunnyliangjy@gmail.com" <sunnyliangjy@gmail.com>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        Michal Simek <michals@xilinx.com>,
        "michael.auchter@ni.com" <michael.auchter@ni.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Oct 8, 2020 at 4:21 PM Ben Levinsky <BLEVINSK@xilinx.com> wrote:

> As you said, this is  just regular ARM TCM memory (as seen by the main AR=
M64 cluster).
> Yes I can add back the compatible string, though maybe just "tcm" or "xln=
x,tcm"

I mean that if it is an ARM standard feature it should be prefixed "arm,"

> That being said, we can change this around to couple the TCM bank nodes i=
nto the R5 as we have In our present, internal implementation at
> - https://github.com/Xilinx/linux-xlnx/blob/master/Documentation/devicetr=
ee/bindings/remoteproc/xilinx%2Czynqmp-r5-remoteproc.txt
> - https://github.com/Xilinx/linux-xlnx/blob/master/drivers/remoteproc/zyn=
qmp_r5_remoteproc.c
> the TCM nodes are coupled in the R5 but after some previous review on thi=
s list, it was moved to have the TCM nodes decoupled from the R5 node
>
> I am not sure what you mean on the Arm64 handling of TCM memory. Via the =
architecture of the SoC https://www.xilinx.com/support/documentation/user_g=
uides/ug1085-zynq-ultrascale-trm.pdf I know that the A53 cluster can see th=
e absolute addresses of the R5 cluster so the translation is *I think* done=
 as you describe with the CP15 instructions you listed.

It seems like the TCM memories are von Neumann type (either can
contain both code and
data) which removes one of my worries. According to this data sheet
they are also nothing
ARM-provided but a Xilinx invention, and just happen to be hardcoded
at the same address
as TCM memories in ARM32, what a coincidence.

So I take it this is the correct view and you can proceed like this,
sorry for the fuzz.

Yours,
Linus Walleij
