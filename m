Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2108EC433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Mar 2021 16:23:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC24864F17
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Mar 2021 16:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhCQQXO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Mar 2021 12:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbhCQQW4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Mar 2021 12:22:56 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A7CC06174A
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 09:22:56 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id n9so24108155pgi.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 09:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F/NINQB6sPLYh+yrEh/k+DH7DYJo1ZCA8NxADWNTIuc=;
        b=lwy1ZiWIAtcKPMq2R26yQtWGUBjV2/aZx0LQ5/d5QuNihi8Wtz5itX/qLsFLULsdJm
         7h05IW0RREuLx9FjL+YHBC95rXkwbpjzIhuHNIZtFaMA7EuOA+eScoYXw2MGSaFRKVAX
         2P/x3fmsNZ2EPyAEGghzUlj4dmRdMu9OYP8eVLPXGM5xFJ4l161c5YBcpnYSb0si1ad/
         zTwmcmY/rSF9fYLI30rNoc1hu5Dqyjrq1344Tyw4f181YmPSmMJt17lKgUziZxarFICt
         d1uhVm1jNw51JcIejSnN+UQERVi46InH2Km0pKVXytIkQcMw3l9goxuyK196nkww2Hyj
         G+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F/NINQB6sPLYh+yrEh/k+DH7DYJo1ZCA8NxADWNTIuc=;
        b=dPfqBXvD74nZPr4yl/ZUtvphuuU6MQEzWsD3vMoybf78rnlUcWXRs5vJxUU+BY/jeN
         7SGEMnw+uvIfpFKiFZ1iY/Vnjz3IQ6phAdSLxY9Usm2h4CiVFccMQQatKr46B7Nk7cbf
         vOppGpLoOc14AQlRJt08TZFIPP1AFIFkTP3xshsi8+O4q7rlmi0HP0+KMI4s8hebSbCD
         5LA5H9D5QFkAc/P32K25y1eL7zKVKO2HCTbPu7HiJsLq5OLF+IC4MdB7P7SbJdaMx/w3
         y1avcibceTExIaP1tJb+lsKLjQmQReEKKI8ME20dKxlJeUpg3V4AAxk+tPInGS6oSRK5
         WDtg==
X-Gm-Message-State: AOAM532SrR1pk8mGnG1ELMlYOsPnYbwmRcoCyl0hD89FFinhbAn8d1ek
        C0g+FAFQlnS6VeZOXPNN1ljk8Q==
X-Google-Smtp-Source: ABdhPJydMrFwkMHsrjjZHTQdQe8G/EncvIH1JMyUfSF3ZGFQ+NkG6boP3+9sjSylWtMrgquoYZZWbQ==
X-Received: by 2002:aa7:9910:0:b029:1f1:b41b:f95c with SMTP id z16-20020aa799100000b02901f1b41bf95cmr4989428pff.5.1615998175710;
        Wed, 17 Mar 2021 09:22:55 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 14sm20277815pfo.141.2021.03.17.09.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:22:51 -0700 (PDT)
Date:   Wed, 17 Mar 2021 10:22:49 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <michals@xilinx.com>,
        "Ed T. Mooring" <emooring@xilinx.com>
Subject: Re: [PATCH v26 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Message-ID: <20210317162249.GA1494354@xps15>
References: <20210223154447.13247-1-ben.levinsky@xilinx.com>
 <20210223154447.13247-6-ben.levinsky@xilinx.com>
 <20210308190046.GA3983426@xps15>
 <FF6E631A-87E0-4194-844A-E6B58E5B2928@xilinx.com>
 <20210315172558.GA1342614@xps15>
 <1AD6632B-A69E-406B-A644-440B9C8B929F@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1AD6632B-A69E-406B-A644-440B9C8B929F@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[...]

>     >     > +/*
>     >     > + * zynqmp_r5_remoteproc_probe
>     >     > + *
>     >     > + * @pdev: domain platform device for R5 cluster
>     >     > + *
>     >     > + * called when driver is probed, for each R5 core specified in DT,
>     >     > + * setup as needed to do remoteproc-related operations
>     >     > + *
>     >     > + * Return: 0 for success, negative value for failure.
>     >     > + */
>     >     > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
>     >     > +{
>     >     > +	int ret, core_count;
>     >     > +	struct device *dev = &pdev->dev;
>     >     > +	struct device_node *nc;
>     >     > +	enum rpu_oper_mode rpu_mode = PM_RPU_MODE_LOCKSTEP;
>     >     > +	struct list_head *cluster; /* list to track each core's rproc */
>     >     > +	struct zynqmp_r5_rproc *z_rproc;
>     >     > +	struct platform_device *child_pdev;
>     >     > +	struct list_head *pos;
>     >     > +
>     >     > +	ret = of_property_read_u32(dev->of_node, "xlnx,cluster-mode", &rpu_mode);
>     >     > +	if (ret < 0 || (rpu_mode != PM_RPU_MODE_LOCKSTEP &&
>     >     > +			rpu_mode != PM_RPU_MODE_SPLIT)) {
>     >     > +		dev_err(dev, "invalid cluster mode: ret %d mode %x\n",
>     >     > +			ret, rpu_mode);
>     >     > +		return ret;
>     >     > +	}
>     >     > +
>     >     > +	dev_dbg(dev, "RPU configuration: %s\n",
>     >     > +		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
>     >     > +
>     >     > +	/*
>     >     > +	 * if 2 RPUs provided but one is lockstep, then we have an
>     >     > +	 * invalid configuration.
>     >     > +	 */
>     >     > +
>     >     > +	core_count = of_get_available_child_count(dev->of_node);
>     >     > +	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && core_count != 1) ||
>     >     > +	    core_count > MAX_RPROCS)
>     >     > +		return -EINVAL;
>     >     > +
>     >     > +	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
>     >     > +	if (!cluster)
>     >     > +		return -ENOMEM;
>     >     > +	INIT_LIST_HEAD(cluster);
>     >     > +
>     >     > +	ret = devm_of_platform_populate(dev);
>     >     > +	if (ret) {
>     >     > +		dev_err(dev, "devm_of_platform_populate failed, ret = %d\n", ret);
>     >     > +		return ret;
>     >     > +	}
>     >     > +
>     >     > +	/* probe each individual r5 core's remoteproc-related info */
>     >     > +	for_each_available_child_of_node(dev->of_node, nc) {
>     >     > +		child_pdev = of_find_device_by_node(nc);
>     > 
>     >     The device reference needs to be dropped after use, as described in the function
>     >     documentation.
>     > 
>     >     I'm out of time - I will continue tomorrow.
>     > 
>     >     Mathieu
>     > 
>     > 
>     > [Ben] By this do you mean that for each platform_device should have a call like
>     > 	platform_set_drvdata(child_pdev, NULL); if it fails? or something else?
> 
>     Have another read at the documentation and look at how other people have used
>     it.  You may already be aware but Bootlin's kernel cross-reference tool is
>     really good for that.
> 
>     https://elixir.bootlin.com/linux/v5.12-rc3/source
> 
> If I understand what you are saying I will add calls for put_device(child_pdev) in error handling and at end of the loop.

That's one part of it.  But what will happen if there is no errors to deal with?
Where will the reference to child_pdev->dev be dropped?

> 
> 
