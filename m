Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EEAEE4993
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Aug 2023 17:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236804AbjHUR6V (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Aug 2023 13:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbjHUR6V (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Aug 2023 13:58:21 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28D810F
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Aug 2023 10:58:19 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-34baeb01942so12226175ab.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Aug 2023 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692640699; x=1693245499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VO7CqkZaWBLiIGdh7lLoGYUME5rEgXf0vHV0ET/DQ4I=;
        b=J/nJI76KbZl0ewpd6a4QQocNI0MU8TuWe+tGp3TWHfSOKSEshF2YysO76h2QcsD5Sa
         1AAmZCC0SU+278oKJ4TUpB92w3o4rcFkH+OCm2jqJPyFX3mawJlo5FlfkEurUJpGisYw
         fnhsvHsXFvIB6HNtTsFLDitPJgI2RcGGLmo/GGOWAEY7bOOx3l8Tllgc4YDwe17hH/j/
         io69ZHNlUblXDv7L2T2Yho15jVX70fQhnMRShKubXqCLSWEDPCYb8HQYH/RsBQ2+0DMS
         lIMJ41nLTECxSBGGTnXGrvSAZashNBgeN4u/LQDngOQdC7TB0gapo0v/ZJacVIKDrMvL
         1VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692640699; x=1693245499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VO7CqkZaWBLiIGdh7lLoGYUME5rEgXf0vHV0ET/DQ4I=;
        b=JSr7UCSBE1FNTm/hO3W3IcruNkSF6fiTLNqOW3QMG5PfXefK2Za1D4RCg0l+fKVu4S
         +yXod1+5R6bdmMxbJLdQKq5wATcVWn9FzOWI/zdBasJvouDurWHovtG4zwnhjPNH57EI
         0nNH5JSJg2bh2BOM8GCTl0/wbTumv982H8FrWt49/28mg5rsZL+kHDklxcUmmVKtvjQL
         oRbf4omtV1UREo90KTmhIkBBVQZhaYsKN/wvW4URH1fYbks4wiZEujd9TREos/x7KAMu
         rS6RCJBasEtQKGiWlHAEH2l0c8AlAiUkqXlSLGQgpjouw6r2yq04tblc9p0AOmOAir7S
         1O9g==
X-Gm-Message-State: AOJu0Yzf1iSFdlnpBDIzNsVJzaw30F6fl+4Wep1B1O5wEHLKYnDTVWSf
        igS63BJ38IL7TFZPFlDLRFRRhA==
X-Google-Smtp-Source: AGHT+IGkHyZEbiS6/affVkgXWOrYtnRRrvDxQUudZYT2rii37KNbUnKBbkjrtnncM2NUD7PhgR7rGA==
X-Received: by 2002:a92:c5d3:0:b0:349:2cd0:4368 with SMTP id s19-20020a92c5d3000000b003492cd04368mr7726845ilt.18.1692640699077;
        Mon, 21 Aug 2023 10:58:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2289:93a7:5faa:cd11])
        by smtp.gmail.com with ESMTPSA id v10-20020a63ac0a000000b0055b61cd99a1sm6557997pge.81.2023.08.21.10.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 10:58:18 -0700 (PDT)
Date:   Mon, 21 Aug 2023 11:58:15 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
Cc:     Rob Herring <robh@kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Simek, Michal" <michal.simek@amd.com>,
        "Levinsky, Ben" <ben.levinsky@amd.com>,
        "Shah, Tanmay" <tanmay.shah@amd.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH v3] dt-bindings: remoteproc: add Tightly Coupled Memory
 (TCM) bindings
Message-ID: <ZOOltyWikpxc/hII@p14s>
References: <1689964908-22371-1-git-send-email-radhey.shyam.pandey@amd.com>
 <20230724161632.GA3686365-robh@kernel.org>
 <MN0PR12MB5953E72D7950581A8FB5AD82B711A@MN0PR12MB5953.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR12MB5953E72D7950581A8FB5AD82B711A@MN0PR12MB5953.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Aug 12, 2023 at 12:57:39PM +0000, Pandey, Radhey Shyam wrote:
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Monday, July 24, 2023 9:47 PM
> > To: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>
> > Cc: andersson@kernel.org; mathieu.poirier@linaro.org;
> > krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; Simek, Michal
> > <michal.simek@amd.com>; Levinsky, Ben <ben.levinsky@amd.com>; Shah,
> > Tanmay <tanmay.shah@amd.com>; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>
> > Subject: Re: [PATCH v3] dt-bindings: remoteproc: add Tightly Coupled
> > Memory (TCM) bindings
> > 
> > On Sat, Jul 22, 2023 at 12:11:48AM +0530, Radhey Shyam Pandey wrote:
> > > Introduce bindings for TCM memory address space on AMD-xilinx Zynq
> > > UltraScale+ platform. It will help in defining TCM in device-tree
> > > and make it's access platform agnostic and data-driven.
> > 
> > From the subject, it sounds like this is a binding for all of remoteproc for
> > TCMs.
> > 
> > Otherwise,
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> Thanks for the review. Just checking if this patch will be taken through
> devicetree or remoteproc tree?


Please send the driver changes and I'll pickup everything at once.

Thanks,
Mathieu
