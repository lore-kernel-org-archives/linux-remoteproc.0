Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F205CC742A7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Mar 2023 15:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjCJPuL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Mar 2023 10:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbjCJPtr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Mar 2023 10:49:47 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0D44D60D
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Mar 2023 07:41:48 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so5564315pjp.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Mar 2023 07:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678462908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy3JW3n9a29iqNLw2r42ZAxFid5Jn9iGSQowne5RcPw=;
        b=wafpRt78bwVJFGLk0GT5A8Bxpt3o7PHi4IRqMfcWc36iN1mdWEtCoOaFfjQWOKirGu
         NDLNJgR1L6pBha4PgyWYJcBe0LgUp00WjQHZDtzSCUkfCW4lU7BLvefAHPnNGOlPX+cR
         somVJ2F2MNQOTMKqX3CHak9vJvluya4hxtO6SxKWnUI6Rdsy+ZqkKv/1uF3yoT60TMNB
         Vyf1aZWc6yqMr2q6RrfxhBilK1jJ674gxJFW06cU1gXUdtDeHVBRqW8bZi2LBaRVBUF8
         9UDLuoixMT4Mlny/zdD1oAcHwUoIHcXtAtU2NshFNjhCOKbPdCaKpMHDzrWXTaZ4hV/v
         PtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678462908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vy3JW3n9a29iqNLw2r42ZAxFid5Jn9iGSQowne5RcPw=;
        b=b14ryC4Jlpl3+ZK5wdCi9HzAlxjrdWrHt3MVcDKeqef+T70qHmOJj1SYh7ofkxkdmW
         yfYQrqyo9ej39iW+WQo+p2748rUQXOJHehBGj52Cr9+S/ixbpImO0Ff6aupWpMR5Ru+q
         6ENTyt0p5M05y8P/c508TYanhCRaetm38Q9+aARLpBF2jdy+GF7xaE00W9R6WtjUoZXL
         YlTYlHnyUUcnles2SNdMXRGZEpsJfKmChGqBLli5igTxqTWnqJ76Y8QAiUb7ftIeAVZ0
         8oW3XaaoPk9L9WEpaM0iYiMPOUc/E5w5PNiUrobLv4sYlQtnohB0N+K/0pHyCAWimiNm
         xgmA==
X-Gm-Message-State: AO0yUKUcmvNMjihO9Rp9zqC48b9mGLy0V5K4VZk6uSVJJcz6eOt65WOF
        JuUm/Ivsmt8kfQGPKVOmcTA2lg==
X-Google-Smtp-Source: AK7set9bbjp3EtckUC9P5mNZ+dZcmgFRUQgqL0Ap9imHD319D6qEIsesjhYOjI5p0c3ya7Bt3lAXDg==
X-Received: by 2002:a17:90b:3b89:b0:234:ba6f:c980 with SMTP id pc9-20020a17090b3b8900b00234ba6fc980mr27744864pjb.17.1678462908166;
        Fri, 10 Mar 2023 07:41:48 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:233f:47c4:de18:a4ba])
        by smtp.gmail.com with ESMTPSA id lj9-20020a17090b344900b00234ba1cfacbsm123980pjb.17.2023.03.10.07.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 07:41:47 -0800 (PST)
Date:   Fri, 10 Mar 2023 08:41:45 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Hari Nagalla <hnagalla@ti.com>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        kernel@collabora.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: remoteproc: k3-m4f: Add bindings for
 K3 AM64x SoCs
Message-ID: <20230310154145.GA1882384@p14s>
References: <20230302171450.1598576-1-martyn.welch@collabora.com>
 <20230302171450.1598576-2-martyn.welch@collabora.com>
 <20230308205833.GA1768401@p14s>
 <8662e02b-9d28-8ffa-6ec2-5cc6348933fb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8662e02b-9d28-8ffa-6ec2-5cc6348933fb@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Mar 09, 2023 at 05:18:01PM -0600, Hari Nagalla wrote:
> On 3/8/23 14:58, Mathieu Poirier wrote:
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> > > +  - ti,sci
> > > +  - ti,sci-dev-id
> > > +  - ti,sci-proc-ids
> > > +  - resets
> > > +  - firmware-name
> > > +  - mboxes
> > The 'mboxes' property is marked as required but the description section above
> > clearly state the M4F can operate without IPC.
> > 
> Well, when the M4F is used as a safety processor it is typically booted from
> SBL/u-boot and may isolate the MCU domain from main domain/A53 to function
> in higher safety level. In these scenarios there is no remote proc handling
> of M4F life cycle management (LCM) and IPC. But, on the other hand, when the
> M4F is used as a non safety processor its LCM is handled by remote proc(main
> domain) and mailboxes for IPC are required.

Well, what you wrote above is pretty much explained verbatim in the
"description" section of the bindings.  Mailboxes are optional and as such
should not be found under the "required" section.

