Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08E6C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 17:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8877E64F2F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 17:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbhCOR00 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Mar 2021 13:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235815AbhCOR0C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Mar 2021 13:26:02 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07270C061762
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Mar 2021 10:26:01 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id t85so6999486pfc.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Mar 2021 10:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EjQXxrwttAbhEo1FLmtNHjZNLrmQoYzcEZU4PWLebII=;
        b=iX5seyedwYJinOO631Rxb2t4ZY/yyn1e1AIu8SkT+QPdALHWgzUAcwvUMNysFjkkAm
         3CmtEJ96HM+f+wVTAoGsSbQ51C6zWmiixBs+KE4DRsCjp9GhddSUHxbjzcpwJxK4vvie
         bvU7pdlQh6ZPNsIbwHyuXKZFfygPQB5KRPg1w7K4D1JfqRIaDBfj1AyTxlV7jLWc1ux7
         Hm0f08/S/JRMe/V3VEt/2Iz4Bjzd+YImYJqEZSRdymswCSsAOPsNDsYeFbExytN/+mLZ
         rn42pTG5gp/qhBuyxDID45rtP2HPxvWGUrJoGuaWJvum2LWr4/d/hfMjC0m+xuHfU4fL
         h9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EjQXxrwttAbhEo1FLmtNHjZNLrmQoYzcEZU4PWLebII=;
        b=qK1Hl/m0n9Kiew7sAh9WEX77HhUYpAbR+M+GZoH9wVyzgi4ezO3Ty06TkcfEyfuE+G
         2qf49qEc4ND57inPl/40ig9U5Ksm4U5Qiq+cikabiAJqH/TdKmU8ZjurfWi+KH7DKShx
         MXHSAEd+MNXMDVI4mcEKpX+FIhzOVBAMK296ewA2sN9od8IT9l+ESmYdT/2vfc14dIO2
         Nj2ATG06wFm9T7frHoC4K6O0R+Ff3Ka/OzRhNmVHSigd5nS0AZxtHYYrvt+18eD0teHT
         7aRDinIJqQVPtDjL06SgM3nBG5XRV2P0Hn+Jy/I29BzeMe51UvahaU4Gt4aFgoRMYZrm
         nZrw==
X-Gm-Message-State: AOAM530iGjRTzhFjywIpcGCO5+ugAxNFd2BRRSEqizoX25znAhPCyj65
        sx52dssAUSGHrWiBvv3yd3/EG7ul0+3QHw==
X-Google-Smtp-Source: ABdhPJwFjgHMTifCO2ACWcmaxXCGs1651K6ti25W4jfqOEuK6SQuvZFEWs3CpQl45DXQBM+MLbIRNw==
X-Received: by 2002:a63:e651:: with SMTP id p17mr182436pgj.324.1615829161228;
        Mon, 15 Mar 2021 10:26:01 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id v7sm14041519pfv.93.2021.03.15.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:26:00 -0700 (PDT)
Date:   Mon, 15 Mar 2021 11:25:58 -0600
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
Message-ID: <20210315172558.GA1342614@xps15>
References: <20210223154447.13247-1-ben.levinsky@xilinx.com>
 <20210223154447.13247-6-ben.levinsky@xilinx.com>
 <20210308190046.GA3983426@xps15>
 <FF6E631A-87E0-4194-844A-E6B58E5B2928@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FF6E631A-87E0-4194-844A-E6B58E5B2928@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

>     > +
>     > +static void zynqmp_r5_cleanup_mbox(struct zynqmp_r5_rproc *z_rproc)
>     > +{
>     > +	mbox_free_channel(z_rproc->tx_chan);
>     > +	mbox_free_channel(z_rproc->rx_chan);
>     > +}
>     > +
>     > +/**
>     > + * zynqmp_r5_probe - Probes ZynqMP R5 processor device node
>     > + *		       this is called for each individual R5 core to
>     > + *		       set up mailbox, Xilinx platform manager unique ID,
>     > + *		       add to rproc core
> 
>     The above has changed since last time, which makes it harder for me to
>     review your work.  From hereon please change only the things I point out so that
>     we keep the same goal posts from one revision to the other.
> 
>     The tabulation needs to be fixed:  
> 
>             * zynqmp_r5_probe - Probes ZynqMP R5 processor device node
>             *
>             * This is called for each individual R5 core to set up mailbox, Xilinx
>             * platform manager unique ID, add to rproc core.
> 
>     The description is also broken.
> 
> [Ben] Ok. How is the following:
> /**                                                                                
>  * zynqmp_r5_probe - Probes ZynqMP R5 processor device node                        
>  *                                                                                 
>  * This is called for each individual R5 core to set up mailbox, Xilinx            
>  * platform manager unique ID, collect SRAM information and wire in                
>  * driver-specific data to to rproc core.                                          
>  *                                                                                 
>  * @pdev: domain platform device for current R5 core                               
>  * @node: pointer of the device node for current R5 core                           
>  * @rpu_mode: mode to configure RPU, split or lockstep                             
>  *                                                                                 
>  * Return: 0 for success, negative value for failure.                              

Much better

>  */                                                                                
> static struct zynqmp_r5_rproc *zynqmp_r5_probe(struct platform_device *pdev,       
>                                                struct device_node *node,           
>                                                enum rpu_oper_mode rpu_mode) 
> 
> 
>     > + *
>     > + * @pdev: domain platform device for current R5 core
>     > + * @node: pointer of the device node for current R5 core
>     > + * @rpu_mode: mode to configure RPU, split or lockstep
>     > + *
>     > + * Return: 0 for success, negative value for failure.
>     > + */
>     > +static struct zynqmp_r5_rproc *zynqmp_r5_probe(struct platform_device *pdev,
>     > +					       struct device_node *node,
>     > +					       enum rpu_oper_mode rpu_mode)
>     > +{
>     > +	int ret, num_banks;
>     > +	struct device *dev = &pdev->dev;
>     > +	struct rproc *rproc_ptr;
>     > +	struct zynqmp_r5_rproc *z_rproc;
>     > +	struct device_node *r5_node;
>     > +
>     > +	/* Allocate remoteproc instance */
>     > +	rproc_ptr = devm_rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
>     > +				     NULL, sizeof(struct zynqmp_r5_rproc));
>     > +	if (!rproc_ptr) {
>     > +		ret = -ENOMEM;
>     > +		goto error;
>     > +	}
>     > +
>     > +	rproc_ptr->auto_boot = false;
>     > +	z_rproc = rproc_ptr->priv;
>     > +	z_rproc->rproc = rproc_ptr;
>     > +	r5_node = z_rproc->rproc->dev.parent->of_node;
>     > +
>     > +	/* Set up DMA mask */
>     > +	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
>     > +	if (ret)
>     > +		goto error;
>     > +
>     > +	/* Get R5 power domain node */
>     > +	ret = of_property_read_u32(node, "power-domain", &z_rproc->pnode_id);
>     > +	if (ret)
>     > +		goto error;
>     > +
>     > +	ret = r5_set_mode(z_rproc, rpu_mode);
>     > +	if (ret)
>     > +		goto error;
>     > +
>     > +	if (of_property_read_bool(node, "mboxes")) {
>     > +		ret = zynqmp_r5_setup_mbox(z_rproc, node);
>     > +		if (ret)
>     > +			goto error;
>     > +	}
>     > +
>     > +	/* go through TCM banks for r5 node */
>     > +	num_banks = of_count_phandle_with_args(r5_node, BANK_LIST_PROP, NULL);
> 
>     Shouldn't this be @node instead of @r5_node?
> 
> [Ben]  Yes this should and will be node.
> 
>     > +	if (num_banks <= 0) {
>     > +		dev_err(dev, "need to specify TCM banks\n");
>     > +		ret = -EINVAL;
>     > +		goto error;
>     > +	}
>     > +
>     > +	if (num_banks > NUM_SRAMS) {
>     > +		dev_err(dev, "max number of srams is %d. given: %d \r\n",
>     > +			NUM_SRAMS, num_banks);
>     > +		ret = -EINVAL;
>     > +		goto error;
>     > +	}
>     > +
>     > +	/* construct collection of srams used by the current R5 core */
>     > +	for (; num_banks; num_banks--) {
>     > +		struct resource rsc;
>     > +		struct device_node *dt_node;
>     > +		resource_size_t size;
>     > +		int i;
>     > +
>     > +		dt_node = of_parse_phandle(r5_node, BANK_LIST_PROP, i);
>     > +		if (!dt_node) {
>     > +			ret = -EINVAL;
>     > +			goto error;
>     > +		}
>     > +
>     > +		ret = of_address_to_resource(dt_node, 0, &rsc);
>     > +		if (ret < 0) {
>     > +			of_node_put(dt_node);
>     > +			goto error;
>     > +		}
>     > +
>     > +		of_node_put(dt_node);
>     > +		size = resource_size(&rsc);
>     > +
>     > +		/*
>     > +		 * Find corresponding Xilinx platform management ID.
>     > +		 * The bank information is used in prepare/unprepare and
>     > +		 * parse_fw.
>     > +		 */
>     > +		for (i = 0; i < NUM_SRAMS; i++) {
>     > +			if (rsc.start == zynqmp_banks[i].addr) {
>     > +				z_rproc->srams[i].addr = rsc.start;
>     > +				z_rproc->srams[i].size = size;
>     > +				z_rproc->srams[i].id = zynqmp_banks[i].id;
>     > +				break;
>     > +			}
>     > +		}
>     > +
>     > +		if (i == NUM_SRAMS) {
>     > +			dev_err(dev, "sram %llx is not valid.\n", rsc.start);
>     > +			ret = -EINVAL;
>     > +			goto error;
>     > +		}
>     > +	}
> 
>     Everything that is related to the initialisation of srams above should be in a
>     function on its own.  This too is new code that wasn't requested - the next
>     revision needs to include *only* the changes I request.  Any improvement on the
>     current implementation can be made in future patchsets. 
> 
> 
> [Ben] Makes sense. I will do that going forward. For probe() I will put all the sram information collection functionality in 1 function.
> 
>     > +
>     > +	/* Add R5 remoteproc */
>     > +	ret = devm_rproc_add(dev, rproc_ptr);
>     > +	if (ret) {
>     > +		zynqmp_r5_cleanup_mbox(z_rproc);
>     > +		goto error;
>     > +	}
>     > +
>     > +	return z_rproc;
>     > +error:
>     > +	return ERR_PTR(ret);
>     > +}
>     > +
>     > +/*
>     > + * zynqmp_r5_remoteproc_probe
>     > + *
>     > + * @pdev: domain platform device for R5 cluster
>     > + *
>     > + * called when driver is probed, for each R5 core specified in DT,
>     > + * setup as needed to do remoteproc-related operations
>     > + *
>     > + * Return: 0 for success, negative value for failure.
>     > + */
>     > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
>     > +{
>     > +	int ret, core_count;
>     > +	struct device *dev = &pdev->dev;
>     > +	struct device_node *nc;
>     > +	enum rpu_oper_mode rpu_mode = PM_RPU_MODE_LOCKSTEP;
>     > +	struct list_head *cluster; /* list to track each core's rproc */
>     > +	struct zynqmp_r5_rproc *z_rproc;
>     > +	struct platform_device *child_pdev;
>     > +	struct list_head *pos;
>     > +
>     > +	ret = of_property_read_u32(dev->of_node, "xlnx,cluster-mode", &rpu_mode);
>     > +	if (ret < 0 || (rpu_mode != PM_RPU_MODE_LOCKSTEP &&
>     > +			rpu_mode != PM_RPU_MODE_SPLIT)) {
>     > +		dev_err(dev, "invalid cluster mode: ret %d mode %x\n",
>     > +			ret, rpu_mode);
>     > +		return ret;
>     > +	}
>     > +
>     > +	dev_dbg(dev, "RPU configuration: %s\n",
>     > +		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
>     > +
>     > +	/*
>     > +	 * if 2 RPUs provided but one is lockstep, then we have an
>     > +	 * invalid configuration.
>     > +	 */
>     > +
>     > +	core_count = of_get_available_child_count(dev->of_node);
>     > +	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && core_count != 1) ||
>     > +	    core_count > MAX_RPROCS)
>     > +		return -EINVAL;
>     > +
>     > +	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
>     > +	if (!cluster)
>     > +		return -ENOMEM;
>     > +	INIT_LIST_HEAD(cluster);
>     > +
>     > +	ret = devm_of_platform_populate(dev);
>     > +	if (ret) {
>     > +		dev_err(dev, "devm_of_platform_populate failed, ret = %d\n", ret);
>     > +		return ret;
>     > +	}
>     > +
>     > +	/* probe each individual r5 core's remoteproc-related info */
>     > +	for_each_available_child_of_node(dev->of_node, nc) {
>     > +		child_pdev = of_find_device_by_node(nc);
> 
>     The device reference needs to be dropped after use, as described in the function
>     documentation.
> 
>     I'm out of time - I will continue tomorrow.
> 
>     Mathieu
> 
> 
> [Ben] By this do you mean that for each platform_device should have a call like
> 	platform_set_drvdata(child_pdev, NULL); if it fails? or something else?

Have another read at the documentation and look at how other people have used
it.  You may already be aware but Bootlin's kernel cross-reference tool is
really good for that.

https://elixir.bootlin.com/linux/v5.12-rc3/source

