Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14D8C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Mar 2021 16:54:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76F1065230
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Mar 2021 16:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhCIQyC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Mar 2021 11:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbhCIQxd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Mar 2021 11:53:33 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757B8C06175F
        for <linux-remoteproc@vger.kernel.org>; Tue,  9 Mar 2021 08:53:33 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id a24so6863118plm.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Mar 2021 08:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+ZOJ+q+9GrjSVjROsRMTtXkkkgpZZ6Smo3szpJto3wU=;
        b=Io2xWfY9wnrkX9lmPqNI9hYZoExbsPaHOBplkGOOIwV6ptdPGsIOBmO/z2VhLrjOgM
         yLC5Dw/z7nQSuQ0ZBDCxsTF96vjE139Z21tbFEX3yX5cgwdttt2NB3y6Oz3wjTO/ptDb
         9bqd5TlfxsAM0U2TDhwQhPpmSEDZUduV/D5f4HbI88jqRE5oaeTVBW9BKg5FS0PV8zR/
         lnq+SiwkfiXszS8Ly73G1dF+c302HTpan+8JD0S+3pL0kxEUCwzI+/ltLU75bAkmm9ez
         CpXFMy7s/+X9bGg8TL68I31LAxpesjjF/P4hLkeu/h7Qc0BJmT3RMy5o244Qr77V6qcd
         IFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+ZOJ+q+9GrjSVjROsRMTtXkkkgpZZ6Smo3szpJto3wU=;
        b=buCfOYb/3kx+wkn0dzOTk8c0WR3to1d94vroxwLFE8Mb1WUMm+W/dWF58FhZP2wL/U
         j+ax1Z9Mk2fsxmHiSHGqP9CTk/SQpi91t9diFqYMRmarMSZ8VeuN8AXMwpH476oVvS+4
         HVfF6FYQ1mDbY3Wd/Mimf4snbhbQNXSShiBxPatnK44W3GwbwgJXgHhUWET5mXOiWY7G
         EAh1Xfr4BHuwAWcDlqKqub3M4qe/bHzEAoj7sW9UzzgS3hyAtzyIAT6RbrAJWCunvUue
         YomoT6a/tkbBQXv86QWwY/ZWliqkjuBKptXZ7wNkGg5YBUZNhud7DbwFpJdrKFcMrnCr
         8b7g==
X-Gm-Message-State: AOAM533vKU4Gb+r5Qgu9yp5OHuXstqDDolrBiklRgAEDrddRVW85YgAZ
        fzvfVz9f2gE2C25i0y2GZ8H8P9tY49jTtw==
X-Google-Smtp-Source: ABdhPJyY4wZlJq47IGitXGbUEifHWMwGH2iiYWGwHxCQ5S3XqNMR3di6XBVmbidz1+Dv+vm8UOEbdA==
X-Received: by 2002:a17:90a:8417:: with SMTP id j23mr5631532pjn.224.1615308812848;
        Tue, 09 Mar 2021 08:53:32 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id s1sm13376084pfe.151.2021.03.09.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:53:32 -0800 (PST)
Date:   Tue, 9 Mar 2021 09:53:30 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        michal.simek@xilinx.com
Subject: Re: [PATCH v26 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Message-ID: <20210309165330.GA4013290@xps15>
References: <20210223154447.13247-1-ben.levinsky@xilinx.com>
 <20210223154447.13247-6-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223154447.13247-6-ben.levinsky@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[...]

> +
> +/**
> + * zynqmp_r5_probe - Probes ZynqMP R5 processor device node
> + *		       this is called for each individual R5 core to
> + *		       set up mailbox, Xilinx platform manager unique ID,
> + *		       add to rproc core
> + *
> + * @pdev: domain platform device for current R5 core
> + * @node: pointer of the device node for current R5 core
> + * @rpu_mode: mode to configure RPU, split or lockstep
> + *
> + * Return: 0 for success, negative value for failure.
> + */
> +static struct zynqmp_r5_rproc *zynqmp_r5_probe(struct platform_device *pdev,
> +					       struct device_node *node,
> +					       enum rpu_oper_mode rpu_mode)
> +{
> +	int ret, num_banks;
> +	struct device *dev = &pdev->dev;
> +	struct rproc *rproc_ptr;
> +	struct zynqmp_r5_rproc *z_rproc;
> +	struct device_node *r5_node;
> +
> +	/* Allocate remoteproc instance */
> +	rproc_ptr = devm_rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
> +				     NULL, sizeof(struct zynqmp_r5_rproc));
> +	if (!rproc_ptr) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	rproc_ptr->auto_boot = false;
> +	z_rproc = rproc_ptr->priv;
> +	z_rproc->rproc = rproc_ptr;
> +	r5_node = z_rproc->rproc->dev.parent->of_node;
> +
> +	/* Set up DMA mask */
> +	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		goto error;
> +
> +	/* Get R5 power domain node */
> +	ret = of_property_read_u32(node, "power-domain", &z_rproc->pnode_id);
> +	if (ret)
> +		goto error;
> +
> +	ret = r5_set_mode(z_rproc, rpu_mode);
> +	if (ret)
> +		goto error;
> +
> +	if (of_property_read_bool(node, "mboxes")) {
> +		ret = zynqmp_r5_setup_mbox(z_rproc, node);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	/* go through TCM banks for r5 node */
> +	num_banks = of_count_phandle_with_args(r5_node, BANK_LIST_PROP, NULL);
> +	if (num_banks <= 0) {
> +		dev_err(dev, "need to specify TCM banks\n");
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
> +	if (num_banks > NUM_SRAMS) {
> +		dev_err(dev, "max number of srams is %d. given: %d \r\n",
> +			NUM_SRAMS, num_banks);
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
> +	/* construct collection of srams used by the current R5 core */
> +	for (; num_banks; num_banks--) {
> +		struct resource rsc;
> +		struct device_node *dt_node;
> +		resource_size_t size;
> +		int i;
> +
> +		dt_node = of_parse_phandle(r5_node, BANK_LIST_PROP, i);

Variable @i is not initialised but it is used as an index to retrieve a handle
to the sram banks.  That code _should_ have failed frequently or at least have
yielded abnormal results often enough to be noticed.  Why wasn't it the case?

I will stop here for the moment.

> +		if (!dt_node) {
> +			ret = -EINVAL;
> +			goto error;
> +		}
> +
> +		ret = of_address_to_resource(dt_node, 0, &rsc);
> +		if (ret < 0) {
> +			of_node_put(dt_node);
> +			goto error;
> +		}
> +
> +		of_node_put(dt_node);
> +		size = resource_size(&rsc);
> +
> +		/*
> +		 * Find corresponding Xilinx platform management ID.
> +		 * The bank information is used in prepare/unprepare and
> +		 * parse_fw.
> +		 */
> +		for (i = 0; i < NUM_SRAMS; i++) {
> +			if (rsc.start == zynqmp_banks[i].addr) {
> +				z_rproc->srams[i].addr = rsc.start;
> +				z_rproc->srams[i].size = size;
> +				z_rproc->srams[i].id = zynqmp_banks[i].id;
> +				break;
> +			}
> +		}
> +
> +		if (i == NUM_SRAMS) {
> +			dev_err(dev, "sram %llx is not valid.\n", rsc.start);
> +			ret = -EINVAL;
> +			goto error;
> +		}
> +	}
> +
> +	/* Add R5 remoteproc */
> +	ret = devm_rproc_add(dev, rproc_ptr);
> +	if (ret) {
> +		zynqmp_r5_cleanup_mbox(z_rproc);
> +		goto error;
> +	}
> +
> +	return z_rproc;
> +error:
> +	return ERR_PTR(ret);
> +}
> +
> +/*
> + * zynqmp_r5_remoteproc_probe
> + *
> + * @pdev: domain platform device for R5 cluster
> + *
> + * called when driver is probed, for each R5 core specified in DT,
> + * setup as needed to do remoteproc-related operations
> + *
> + * Return: 0 for success, negative value for failure.
> + */
> +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> +{
> +	int ret, core_count;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *nc;
> +	enum rpu_oper_mode rpu_mode = PM_RPU_MODE_LOCKSTEP;
> +	struct list_head *cluster; /* list to track each core's rproc */
> +	struct zynqmp_r5_rproc *z_rproc;
> +	struct platform_device *child_pdev;
> +	struct list_head *pos;
> +
> +	ret = of_property_read_u32(dev->of_node, "xlnx,cluster-mode", &rpu_mode);
> +	if (ret < 0 || (rpu_mode != PM_RPU_MODE_LOCKSTEP &&
> +			rpu_mode != PM_RPU_MODE_SPLIT)) {
> +		dev_err(dev, "invalid cluster mode: ret %d mode %x\n",
> +			ret, rpu_mode);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "RPU configuration: %s\n",
> +		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
> +
> +	/*
> +	 * if 2 RPUs provided but one is lockstep, then we have an
> +	 * invalid configuration.
> +	 */
> +
> +	core_count = of_get_available_child_count(dev->of_node);
> +	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && core_count != 1) ||
> +	    core_count > MAX_RPROCS)
> +		return -EINVAL;
> +
> +	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
> +	if (!cluster)
> +		return -ENOMEM;
> +	INIT_LIST_HEAD(cluster);
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret) {
> +		dev_err(dev, "devm_of_platform_populate failed, ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* probe each individual r5 core's remoteproc-related info */
> +	for_each_available_child_of_node(dev->of_node, nc) {
> +		child_pdev = of_find_device_by_node(nc);
> +		if (!child_pdev) {
> +			dev_err(dev, "could not get R5 core platform device\n");
> +			ret = -ENODEV;
> +			goto out;
> +		}
> +
> +		z_rproc = zynqmp_r5_probe(child_pdev, nc, rpu_mode);
> +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> +			ret ? "Failed" : "Able", nc);
> +		if (IS_ERR(z_rproc)) {
> +			ret = PTR_ERR(z_rproc);
> +			goto out;
> +		}
> +		list_add_tail(&z_rproc->elem, cluster);
> +	}
> +	/* wire in so each core can be cleaned up at driver remove */
> +	platform_set_drvdata(pdev, cluster);
> +	return 0;
> +out:
> +	list_for_each(pos, cluster) {
> +		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
> +		zynqmp_r5_cleanup_mbox(z_rproc);
> +	}
> +	return ret;
> +}
> +
> +/*
> + * zynqmp_r5_remoteproc_remove
> + *
> + * @pdev: domain platform device for R5 cluster
> + *
> + * When the driver is unloaded, clean up the mailboxes for each
> + * remoteproc that was initially probed.
> + */
> +static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
> +{
> +	struct list_head *pos, *temp, *cluster = (struct list_head *)
> +						 platform_get_drvdata(pdev);
> +	struct zynqmp_r5_rproc *z_rproc = NULL;
> +
> +	list_for_each_safe(pos, temp, cluster) {
> +		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
> +		zynqmp_r5_cleanup_mbox(z_rproc);
> +	}
> +	return 0;
> +}
> +
> +/* Match table for OF platform binding */
> +static const struct of_device_id zynqmp_r5_remoteproc_match[] = {
> +	{ .compatible = "xlnx,zynqmp-r5-remoteproc", },
> +	{ /* end of list */ },
> +};
> +MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
> +
> +static struct platform_driver zynqmp_r5_remoteproc_driver = {
> +	.probe = zynqmp_r5_remoteproc_probe,
> +	.remove = zynqmp_r5_remoteproc_remove,
> +	.driver = {
> +		.name = "zynqmp_r5_remoteproc",
> +		.of_match_table = zynqmp_r5_remoteproc_match,
> +	},
> +};
> +module_platform_driver(zynqmp_r5_remoteproc_driver);
> +
> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
