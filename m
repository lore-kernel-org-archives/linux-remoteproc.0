Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C66C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 21:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BB9964E7A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 21:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhBQV7H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 16:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbhBQV7G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 16:59:06 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46ABC0613D6
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Feb 2021 13:58:25 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id fy5so97898pjb.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Feb 2021 13:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VJ5vDoqMOQdkljYFz9ipyZeNCl1WDBvJaqqcXXqFDd8=;
        b=om67rYYQ5aKwvoFSnQpugb1hWZHGu2oKLzmnYtWqN95L+KeWcydSdR7V/DXTTnURfg
         wcRdNKuAVacqoUBwiJJuyBEdL3fv2Ke2cZ3kNhbf5m6kqh5feD3SosGLY15K/yFbX/dj
         NGnFiRa2yjQBL3c5sFI0XUKR83dAd7tLNH1XYznheZKb//3dlqmmRCGj+NbmpmHoy2Gf
         46D0UNhc4rGAv0tTL75mWadLEm6OfwTcYh51LSM/mu97IYfruuNEUv/tqWXQgE/nmTQb
         r04pf7mAXVVmWMd/YAl36IKzKUln3wSNXX9g+t1mG401j4K9mxIC2VV9dcYOrS58OCmW
         Coew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VJ5vDoqMOQdkljYFz9ipyZeNCl1WDBvJaqqcXXqFDd8=;
        b=ANgdLkt0PByoTcqqhHSD1gHFHAC3l3Xsogwe6O4PNW0NO6ICXjPJ3A1V3AcSOe7ZhA
         IlFPmpqyORCaHB04wkGRTL4ndDdvIKHGz514TEKTPxEN6zi6bh8iQ8HcGQWejMNmK5Om
         07KcuVqTqs0iMMCdPyn8xPQUiyggYVlk/LQl1S8C2d2iu+P+OY+qLdtljWc6s6BRGkQx
         6s6Bod1t/1F+/CZ2MjGWcbpzxaybZtTuNyUeTMwVIpwTf+mgQq/yekpfZXtkt3KrGJqH
         Od0zONpJX8q62LpOYdhVkOajwtDVqme6S0ZEIDRRCWWzvHRoN2c1Txp/9dANmRQG3cWH
         o0Ng==
X-Gm-Message-State: AOAM532E1iQrUZFZ5f9XWkBwFqXuJjumuSTGpLSSAJ2m0WUr0TFeuwXe
        MF619zcEi67jRPJSxee0iyP3mw==
X-Google-Smtp-Source: ABdhPJy6+L6+F3q1GwWZ41JJmf5ziudv53VRYMhYZJ0+uHWK6hSkMQGi8nzlAGrakYF+Q5uapaJsRQ==
X-Received: by 2002:a17:902:e989:b029:e2:8c9d:78ba with SMTP id f9-20020a170902e989b02900e28c9d78bamr1018096plb.81.1613599104982;
        Wed, 17 Feb 2021 13:58:24 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b14sm3271443pfi.74.2021.02.17.13.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 13:58:24 -0800 (PST)
Date:   Wed, 17 Feb 2021 14:58:22 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <michals@xilinx.com>
Subject: Re: [PATCH v25 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Message-ID: <20210217215822.GC2800385@xps15>
References: <20210111020250.6846-1-ben.levinsky@xilinx.com>
 <20210111020250.6846-6-ben.levinsky@xilinx.com>
 <20210216184807.GB2771622@xps15>
 <BYAPR02MB44076ACC6C565155018FA3E8B5869@BYAPR02MB4407.namprd02.prod.outlook.com>
 <BYAPR02MB44070DE0C6A8014D5442C566B5869@BYAPR02MB4407.namprd02.prod.outlook.com>
 <BYAPR02MB4407F45406815CCD319D93F9B5869@BYAPR02MB4407.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR02MB4407F45406815CCD319D93F9B5869@BYAPR02MB4407.namprd02.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Feb 17, 2021 at 09:34:13PM +0000, Ben Levinsky wrote:
> 1 more for the pnode_id comment
>

[...]
 
> > > > > +static int parse_tcm_banks(struct rproc *rproc)
> > > > > +{
> > > > > +	int i, num_banks;
> > > > > +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> > > > > +	struct device *dev = &rproc->dev;
> > > > > +	struct device_node *r5_node = z_rproc->dev->of_node;
> > > > > +
> > > > > +	/* go through TCM banks for r5 node */
> > > > > +	num_banks = of_count_phandle_with_args(r5_node,
> > > > BANK_LIST_PROP, NULL);
> > > > > +	if (num_banks <= 0) {
> > > > > +		dev_err(dev, "need to specify TCM banks\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +	for (i = 0; i < num_banks; i++) {
> > > > > +		struct resource rsc;
> > > > > +		resource_size_t size;
> > > > > +		struct device_node *dt_node;
> > > > > +		struct rproc_mem_entry *mem;
> > > > > +		int ret;
> > > > > +		u32 pnode_id; /* zynqmp_pm* fn's expect u32 */
> > > > > +
> > > > > +		dt_node = of_parse_phandle(r5_node, BANK_LIST_PROP, i);
> > > > > +		if (!dt_node)
> > > > > +			return -EINVAL;
> > > > > +
> > > > > +		ret = of_address_to_resource(dt_node, 0, &rsc);
> > > > > +		if (ret < 0) {
> > > > > +			of_node_put(dt_node);
> > > > > +			return ret;
> > > > > +		}
> > > > > +		of_node_put(dt_node);
> > > > > +
> > > > > +		ret = zynqmp_r5_pm_request_sram(rsc.start);
> > > > > +		if (ret < 0)
> > > > > +			return ret;
> > > > > +
> > > > > +		/* add carveout */
> > > > > +		size = resource_size(&rsc);
> > > > > +		mem = rproc_mem_entry_init(dev, NULL, rsc.start,
> > > > > +					   (size_t)size, rsc.start,
> > > > > +					   tcm_mem_alloc,
> > > > > +					   tcm_mem_release,
> > > > > +					   rsc.name);
> > > > > +		if (!mem) {
> > > > > +			ret = zynqmp_pm_release_node(pnode_id);
> > > >
> > > > Where is @pnode_id initialised?
> > >
> > > Good catch. Previously this was value set in an earlier iteration. I will fix this
> > > as follows:
> > > - release the R5 cluster by instead passing z_rproc->pnode_id
> > > - release the TCM bank via call to release_sram
> > >
> > > This will also remove the variable pnode_id.
> > >
> 
> 
> typo release_sram should be release_node()
> 
> also instead another, cleaner way might be as follows:
> change zynqmp_r5_request_sram so that it takes 1 more arg to return by reference the TCM bank's Xilinx platform management ID and then set the TCM bank's ID with that information.
> 

That sounds more reasonable.

> Thanks
> Ben
> 
> > > >
> > > > > +			if (ret)
> > > > > +				dev_warn(dev,
> > > > > +					 "fail to release node: %x ret: %x\n",
> > > > > +					 pnode_id, ret);
> > > > > +			return -ENOMEM;
> > > > > +		}
> > > > > +
> > > > > +		mem->priv = (void *)(u64)pnode_id;
> > > >
> > > >
> > > > And here too - how does this work when you test things out on your side?
> > > >
> > > > Please note that I will need a reply to these questions before I review
> > > another
> > > > set.
> > > >
> > > Here I will update as follows:
> > > - set mem->priv to value from zynqmp_banks lookup table that contains
> > > power node IDs
> > >
> > >
> > > > > +		rproc_add_carveout(rproc, mem);
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * zynqmp_r5_parse_fw()
> > > > > + * @rproc: single R5 core's corresponding rproc instance
> > > > > + * @fw: ptr to firmware to be loaded onto r5 core
> > > > > + *
> > > > > + * When loading firmware, ensure the necessary carveouts are in
> > > > remoteproc
> > > > > + *
> > > > > + * return 0 on success, otherwise non-zero value on failure
> > > > > + */
> > > > > +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct
> > firmware
> > > > *fw)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = parse_tcm_banks(rproc);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret = parse_mem_regions(rproc);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret = rproc_elf_load_rsc_table(rproc, fw);
> > > > > +	if (ret == -EINVAL) {
> > > > > +		/*
> > > > > +		 * resource table only required for IPC.
> > > > > +		 * if not present, this is not necessarily an error;
> > > > > +		 * for example, loading r5 hello world application
> > > > > +		 * so simply inform user and keep going.
> > > > > +		 */
> > > > > +		dev_info(&rproc->dev, "no resource table found.\n");
> > > > > +		ret = 0;
> > > > > +	}
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * zynqmp_r5_rproc_kick() - kick a firmware if mbox is provided
> > > > > + * @rproc: r5 core's corresponding rproc structure
> > > > > + * @vqid: virtqueue ID
> > > > > + */
> > > > > +static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
> > > > > +{
> > > > > +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> > > > > +	struct device *dev = rproc->dev.parent;
> > > > > +	struct zynqmp_ipi_message *mb_msg = NULL;
> > > > > +	unsigned int skb_len;
> > > > > +	struct sk_buff *skb;
> > > > > +	int ret;
> > > > > +
> > > > > +	/* If vqid is negative, do not pass the vqid to
> > > > > +	 * mailbox as vqid is supposed to be 0 or positive.
> > > > > +	 * It also gives a way to just kick instead but
> > > > > +	 * not use the IPI buffer.
> > > > > +	 *
> > > > > +	 * For now use negative vqid to assume no message will be
> > > > > +	 * passed with IPI buffer, but just raise interrupt.
> > > > > +	 * This will be faster as it doesn't need to copy the
> > > > > +	 * message to the ZynqMP/Versal IPI message buffer.
> > > > > +	 */
> > > > > +	if (vqid >= 0) {
> > > > > +		skb_len = (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
> > > > > +		skb = alloc_skb(skb_len, GFP_KERNEL);
> > > > > +		if (!skb)
> > > > > +			return;
> > > > > +
> > > > > +		mb_msg = (struct zynqmp_ipi_message *)skb_put(skb,
> > > > skb_len);
> > > > > +		mb_msg->len = sizeof(vqid);
> > > > > +		memcpy(mb_msg->data, &vqid, sizeof(vqid));
> > > > > +
> > > > > +		skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
> > > > > +	}
> > > > > +
> > > > > +	ret = mbox_send_message(z_rproc->tx_chan, mb_msg);
> > > > > +	if (ret < 0) {
> > > > > +		dev_warn(dev, "Failed to kick remote.\n");
> > > > > +		if (mb_msg) {
> > > > > +			skb_dequeue_tail(&z_rproc->tx_mc_skbs);
> > > > > +			kfree_skb(skb);
> > > > > +		}
> > > > > +	}
> > > > > +}
> > > > > +
> > > >
> > > > I am done reviewing this set.
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > > > +static struct rproc_ops zynqmp_r5_rproc_ops = {
> > > > > +	.start		= zynqmp_r5_rproc_start,
> > > > > +	.stop		= zynqmp_r5_rproc_stop,
> > > > > +	.load		= rproc_elf_load_segments,
> > > > > +	.parse_fw	= zynqmp_r5_parse_fw,
> > > > > +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> > > > > +	.sanity_check	= rproc_elf_sanity_check,
> > > > > +	.get_boot_addr	= rproc_elf_get_boot_addr,
> > > > > +	.kick		= zynqmp_r5_rproc_kick,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * event_notified_idr_cb() - event notified idr callback
> > > > > + * @id: idr id
> > > > > + * @ptr: pointer to idr private data
> > > > > + * @data: data passed to idr_for_each callback
> > > > > + *
> > > > > + * Pass notification to remoteproc virtio
> > > > > + *
> > > > > + * Return: 0. having return is to satisfy the idr_for_each() function
> > > > > + *          pointer input argument requirement.
> > > > > + **/
> > > > > +static int event_notified_idr_cb(int id, void *ptr, void *data)
> > > > > +{
> > > > > +	struct rproc *rproc = data;
> > > > > +
> > > > > +	if (rproc_vq_interrupt(rproc, id) == IRQ_NONE)
> > > > > +		dev_dbg(&rproc->dev, "no message was found in idr with id:
> > > > %d\n", id);
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * handle_event_notified() - remoteproc notification work function
> > > > > + * @work: pointer to the work structure
> > > > > + *
> > > > > + * It checks each registered remoteproc notify IDs.
> > > > > + */
> > > > > +static void handle_event_notified(struct work_struct *work)
> > > > > +{
> > > > > +	struct zynqmp_r5_rproc *z_rproc;
> > > > > +	struct rproc *rproc;
> > > > > +
> > > > > +	z_rproc = container_of(work, struct zynqmp_r5_rproc, mbox_work);
> > > > > +	rproc = z_rproc->rproc;
> > > > > +
> > > > > +	/*
> > > > > +	 * This is to simply raise interrupt as ACK for remote.
> > > > > +	 *
> > > > > +	 * Xilinx mailbox, ATF and SoC specific IPI mapping will handle
> > > > > +	 * mapping to remote processor.
> > > > > +	 */
> > > > > +	if (mbox_send_message(z_rproc->rx_chan, NULL) < 0)
> > > > > +		dev_warn(rproc->dev.parent, "Failed to kick remote.\n");
> > > > > +
> > > > > +	/*
> > > > > +	 * We only use IPI for interrupt. The firmware side may or may
> > > > > +	 * not write the notifyid when it trigger IPI.
> > > > > +	 * And thus, we scan through all the registered notifyids.
> > > > > +	 */
> > > > > +	idr_for_each(&rproc->notifyids, event_notified_idr_cb, rproc);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * zynqmp_r5_mb_rx_cb() - Receive channel mailbox callback
> > > > > + * @cl: mailbox client
> > > > > + * @msg: message pointer
> > > > > + *
> > > > > + * It will schedule the R5 notification work.
> > > > > + */
> > > > > +static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> > > > > +{
> > > > > +	struct zynqmp_r5_rproc *z_rproc;
> > > > > +
> > > > > +	z_rproc = container_of(cl, struct zynqmp_r5_rproc, rx_mc);
> > > > > +	/*
> > > > > +	 * Notification can be received with message payload.
> > > > > +	 * To handle this, check for message contents.
> > > > > +	 * If there are contents, copy to ipi message buffer payload location.
> > > > > +	 *
> > > > > +	 * If message is empty, then that means that was simple raising
> > > > > +	 * of interrupt. no payload to process.
> > > > > +	 *
> > > > > +	 * Note: enqueue work regardless of msg as kick may imply that
> > > > remote
> > > > > +	 * is waiting for ack.
> > > > > +	 */
> > > > > +	if (msg) {
> > > > > +		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> > > > > +		size_t len;
> > > > > +
> > > > > +		ipi_msg = (struct zynqmp_ipi_message *)msg;
> > > > > +		buf_msg = (struct zynqmp_ipi_message *)z_rproc->rx_mc_buf;
> > > > > +		len = (ipi_msg->len >= IPI_BUF_LEN_MAX) ?
> > > > > +		      IPI_BUF_LEN_MAX : ipi_msg->len;
> > > > > +		buf_msg->len = len;
> > > > > +		memcpy(buf_msg->data, ipi_msg->data, len);
> > > > > +	}
> > > > > +	schedule_work(&z_rproc->mbox_work);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * zynqmp_r5_mb_tx_done() - Request has been sent to the remote
> > > > > + * @cl: mailbox client
> > > > > + * @msg: pointer to the message which has been sent
> > > > > + * @r: status of last TX - OK or error
> > > > > + *
> > > > > + * It will be called by the mailbox framework when the last TX has
> > done.
> > > > > + */
> > > > > +static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *msg,
> > > int
> > > > r)
> > > > > +{
> > > > > +	struct zynqmp_r5_rproc *z_rproc;
> > > > > +	struct sk_buff *skb;
> > > > > +
> > > > > +	if (!msg)
> > > > > +		return;
> > > > > +	z_rproc = container_of(cl, struct zynqmp_r5_rproc, tx_mc);
> > > > > +	skb = skb_dequeue(&z_rproc->tx_mc_skbs);
> > > > > +	kfree_skb(skb);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * zynqmp_r5_setup_mbox() - Setup mailboxes
> > > > > + *			    this is used for each individual R5 core
> > > > > + *
> > > > > + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> > > > > + * @node: pointer of the device node
> > > > > + *
> > > > > + * Function to setup mailboxes to talk to RPU.
> > > > > + *
> > > > > + * Return: 0 for success, negative value for failure.
> > > > > + */
> > > > > +static int zynqmp_r5_setup_mbox(struct zynqmp_r5_rproc *z_rproc,
> > > > > +				struct device_node *node)
> > > > > +{
> > > > > +	struct mbox_client *mclient;
> > > > > +
> > > > > +	/* Setup TX mailbox channel client */
> > > > > +	mclient			= &z_rproc->tx_mc;
> > > > > +	mclient->dev		= z_rproc->dev;
> > > > > +	mclient->tx_done	= zynqmp_r5_mb_tx_done;
> > > > > +	mclient->tx_block	= false;
> > > > > +	mclient->knows_txdone	= false;
> > > > > +	mclient->rx_callback	= NULL;
> > > > > +
> > > > > +	/* Setup RX mailbox channel client */
> > > > > +	mclient			= &z_rproc->rx_mc;
> > > > > +	mclient->dev		= z_rproc->dev;
> > > > > +	mclient->tx_done	= NULL;
> > > > > +	mclient->tx_block	= false;
> > > > > +	mclient->knows_txdone	= false;
> > > > > +	mclient->rx_callback	= zynqmp_r5_mb_rx_cb;
> > > > > +
> > > > > +	INIT_WORK(&z_rproc->mbox_work, handle_event_notified);
> > > > > +
> > > > > +	/* Request TX and RX channels */
> > > > > +	z_rproc->tx_chan = mbox_request_channel_byname(&z_rproc-
> > > > >tx_mc, "tx");
> > > > > +	if (IS_ERR(z_rproc->tx_chan)) {
> > > > > +		dev_err(z_rproc->dev, "failed to request mbox tx channel.\n");
> > > > > +		return PTR_ERR(z_rproc->tx_chan);
> > > > > +	}
> > > > > +
> > > > > +	z_rproc->rx_chan = mbox_request_channel_byname(&z_rproc-
> > > > >rx_mc, "rx");
> > > > > +	if (IS_ERR(z_rproc->rx_chan)) {
> > > > > +		dev_err(z_rproc->dev, "failed to request mbox rx channel.\n");
> > > > > +		return PTR_ERR(z_rproc->rx_chan);
> > > > > +	}
> > > > > +	skb_queue_head_init(&z_rproc->tx_mc_skbs);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static void zynqmp_r5_cleanup_mbox(struct zynqmp_r5_rproc
> > *z_rproc)
> > > > > +{
> > > > > +	mbox_free_channel(z_rproc->tx_chan);
> > > > > +	mbox_free_channel(z_rproc->rx_chan);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
> > > > > + *		       this is called for each individual R5 core to
> > > > > + *		       set up mailbox, Xilinx platform manager unique
> > ID,
> > > > > + *		       add to rproc core
> > > > > + *
> > > > > + * @pdev: domain platform device for current R5 core
> > > > > + * @node: pointer of the device node for current R5 core
> > > > > + * @rpu_mode: mode to configure RPU, split or lockstep
> > > > > + *
> > > > > + * Return: 0 for success, negative value for failure.
> > > > > + */
> > > > > +static struct zynqmp_r5_rproc *zynqmp_r5_probe(struct
> > platform_device
> > > > *pdev,
> > > > > +					       struct device_node *node,
> > > > > +					       enum rpu_oper_mode
> > > > rpu_mode)
> > > > > +{
> > > > > +	int ret;
> > > > > +	struct device *dev = &pdev->dev;
> > > > > +	struct rproc *rproc_ptr;
> > > > > +	struct zynqmp_r5_rproc *z_rproc;
> > > > > +
> > > > > +	/* Allocate remoteproc instance */
> > > > > +	rproc_ptr = devm_rproc_alloc(dev, dev_name(dev),
> > > > &zynqmp_r5_rproc_ops,
> > > > > +				     NULL, sizeof(struct zynqmp_r5_rproc));
> > > > > +	if (!rproc_ptr) {
> > > > > +		ret = -ENOMEM;
> > > > > +		goto error;
> > > > > +	}
> > > > > +
> > > > > +	rproc_ptr->auto_boot = false;
> > > > > +	z_rproc = rproc_ptr->priv;
> > > > > +	z_rproc->rproc = rproc_ptr;
> > > > > +	z_rproc->dev = dev;
> > > > > +
> > > > > +	/* Set up DMA mask */
> > > > > +	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> > > > > +	if (ret)
> > > > > +		goto error;
> > > > > +
> > > > > +	/* Get R5 power domain node */
> > > > > +	ret = of_property_read_u32(node, "power-domain", &z_rproc-
> > > > >pnode_id);
> > > > > +	if (ret)
> > > > > +		goto error;
> > > > > +
> > > > > +	ret = r5_set_mode(z_rproc, rpu_mode);
> > > > > +	if (ret)
> > > > > +		goto error;
> > > > > +
> > > > > +	if (of_property_read_bool(node, "mboxes")) {
> > > > > +		ret = zynqmp_r5_setup_mbox(z_rproc, node);
> > > > > +		if (ret)
> > > > > +			goto error;
> > > > > +	}
> > > > > +
> > > > > +	/* Add R5 remoteproc */
> > > > > +	ret = devm_rproc_add(dev, rproc_ptr);
> > > > > +	if (ret) {
> > > > > +		zynqmp_r5_cleanup_mbox(z_rproc);
> > > > > +		goto error;
> > > > > +	}
> > > > > +
> > > > > +	return z_rproc;
> > > > > +error:
> > > > > +	return ERR_PTR(ret);
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * zynqmp_r5_remoteproc_probe()
> > > > > + *
> > > > > + * @pdev: domain platform device for R5 cluster
> > > > > + *
> > > > > + * called when driver is probed, for each R5 core specified in DT,
> > > > > + * setup as needed to do remoteproc-related operations
> > > > > + *
> > > > > + * Return: 0 for success, negative value for failure.
> > > > > + */
> > > > > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +	int ret, core_count;
> > > > > +	struct device *dev = &pdev->dev;
> > > > > +	struct device_node *nc;
> > > > > +	enum rpu_oper_mode rpu_mode = PM_RPU_MODE_LOCKSTEP;
> > > > > +	struct list_head *cluster; /* list to track each core's rproc */
> > > > > +	struct zynqmp_r5_rproc *z_rproc;
> > > > > +	struct platform_device *child_pdev;
> > > > > +	struct list_head *pos;
> > > > > +
> > > > > +	ret = of_property_read_u32(dev->of_node, "xlnx,cluster-mode",
> > > > &rpu_mode);
> > > > > +	if (ret < 0 || (rpu_mode != PM_RPU_MODE_LOCKSTEP &&
> > > > > +			rpu_mode != PM_RPU_MODE_SPLIT)) {
> > > > > +		dev_err(dev, "invalid cluster mode: ret %d mode %x\n",
> > > > > +			ret, rpu_mode);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	dev_dbg(dev, "RPU configuration: %s\n",
> > > > > +		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" :
> > > > "split");
> > > > > +
> > > > > +	/*
> > > > > +	 * if 2 RPUs provided but one is lockstep, then we have an
> > > > > +	 * invalid configuration.
> > > > > +	 */
> > > > > +
> > > > > +	core_count = of_get_available_child_count(dev->of_node);
> > > > > +	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && core_count != 1) ||
> > > > > +	    core_count > MAX_RPROCS)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
> > > > > +	if (!cluster)
> > > > > +		return -ENOMEM;
> > > > > +	INIT_LIST_HEAD(cluster);
> > > > > +
> > > > > +	ret = devm_of_platform_populate(dev);
> > > > > +	if (ret) {
> > > > > +		dev_err(dev, "devm_of_platform_populate failed, ret =
> > > > %d\n",
> > > > > +			ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	/* probe each individual r5 core's remoteproc-related info */
> > > > > +	for_each_available_child_of_node(dev->of_node, nc) {
> > > > > +		child_pdev = of_find_device_by_node(nc);
> > > > > +		if (!child_pdev) {
> > > > > +			dev_err(dev, "could not get R5 core platform
> > > > device\n");
> > > > > +			ret = -ENODEV;
> > > > > +			goto out;
> > > > > +		}
> > > > > +
> > > > > +		z_rproc = zynqmp_r5_probe(child_pdev, nc, rpu_mode);
> > > > > +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> > > > > +			ret ? "Failed" : "Able",
> > > > > +			nc);
> > > > > +		if (IS_ERR(z_rproc)) {
> > > > > +			ret = PTR_ERR(z_rproc);
> > > > > +			goto out;
> > > > > +		}
> > > > > +		list_add_tail(&z_rproc->elem, cluster);
> > > > > +	}
> > > > > +	/* wire in so each core can be cleaned up at driver remove */
> > > > > +	platform_set_drvdata(pdev, cluster);
> > > > > +	return 0;
> > > > > +out:
> > > > > +	/*
> > > > > +	 * undo core0 upon any failures on core1 in split-mode
> > > > > +	 *
> > > > > +	 * in zynqmp_r5_probe z_rproc is set to null
> > > > > +	 * and ret to non-zero value if error
> > > > > +	 */
> > > > > +	list_for_each(pos, cluster) {
> > > > > +		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
> > > > > +		zynqmp_r5_cleanup_mbox(z_rproc);
> > > > > +	}
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * zynqmp_r5_remoteproc_remove()
> > > > > + *
> > > > > + * @pdev: domain platform device for R5 cluster
> > > > > + *
> > > > > + * When the driver is unloaded, clean up the mailboxes for each
> > > > > + * remoteproc that was initially probed.
> > > > > + */
> > > > > +static int zynqmp_r5_remoteproc_remove(struct platform_device
> > *pdev)
> > > > > +{
> > > > > +	struct list_head *pos, *temp, *cluster = (struct list_head *)
> > > > > +						 platform_get_drvdata(pdev);
> > > > > +	struct zynqmp_r5_rproc *z_rproc = NULL;
> > > > > +
> > > > > +	list_for_each_safe(pos, temp, cluster) {
> > > > > +		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
> > > > > +		zynqmp_r5_cleanup_mbox(z_rproc);
> > > > > +		list_del(pos);
> > > > > +	}
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +/* Match table for OF platform binding */
> > > > > +static const struct of_device_id zynqmp_r5_remoteproc_match[] = {
> > > > > +	{ .compatible = "xlnx,zynqmp-r5-remoteproc", },
> > > > > +	{ /* end of list */ },
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
> > > > > +
> > > > > +static struct platform_driver zynqmp_r5_remoteproc_driver = {
> > > > > +	.probe = zynqmp_r5_remoteproc_probe,
> > > > > +	.remove = zynqmp_r5_remoteproc_remove,
> > > > > +	.driver = {
> > > > > +		.name = "zynqmp_r5_remoteproc",
> > > > > +		.of_match_table = zynqmp_r5_remoteproc_match,
> > > > > +	},
> > > > > +};
> > > > > +module_platform_driver(zynqmp_r5_remoteproc_driver);
> > > > > +
> > > > > +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
> > > > > +MODULE_LICENSE("GPL v2");
> > > > > --
> > > > > 2.17.1
> > > > >
