Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C00EC2B9F8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 May 2021 18:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A59F613F9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 May 2021 18:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhEYSJD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 25 May 2021 14:09:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54674 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbhEYSJC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 May 2021 14:09:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PI7L0D013427;
        Tue, 25 May 2021 13:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621966041;
        bh=a62IrGMls013A/+zPRN16yFI0x5d7rhyiW4tB0PcC4A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=L9VgT0ajI2zO80bbuNz8Jy3hmapohXgsfKQNRNkoY29ZXN1ptL8CeE/CmmVBrux2N
         IBoOigoGWRjUlcoo/b2VZ997SQpRvp1JBmBJFFoyhk6pbVwj+2feh9c6OCfHDI5uvi
         rOCAfA9EziOWdEQE6zG5vwsFbkwhZoH3q9deESxU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PI7LbR081896
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 May 2021 13:07:21 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 25
 May 2021 13:07:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 25 May 2021 13:07:20 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PI7KCd028881;
        Tue, 25 May 2021 13:07:20 -0500
Subject: Re: [PATCH 2/2] remoteproc: Fix various kernel-doc warnings
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210519180304.23563-1-s-anna@ti.com>
 <20210519180304.23563-3-s-anna@ti.com> <20210525180006.GD1113058@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <81a80b1f-7346-7aa8-4635-e823c3c51c05@ti.com>
Date:   Tue, 25 May 2021 13:07:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210525180006.GD1113058@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/25/21 1:00 PM, Mathieu Poirier wrote:
> On Wed, May 19, 2021 at 01:03:04PM -0500, Suman Anna wrote:
>> Fix all the kernel-doc warnings in various remoteproc core files.
>> Some of them just needed a formatting cleanup change, while others
>> needed the Return statement to be added, or documenting the missed
>> structure elements.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c       | 44 +++++++++++++------
>>  drivers/remoteproc/remoteproc_elf_loader.c | 12 ++++--
>>  drivers/remoteproc/remoteproc_virtio.c     |  6 ++-
>>  include/linux/remoteproc.h                 | 50 ++++++++++++----------
>>  4 files changed, 69 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 8c279039b6a3..6348aaa42bbb 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -183,12 +183,12 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>>   * translations on the internal remoteproc memory regions through a platform
>>   * implementation specific da_to_va ops, if present.
>>   *
>> - * The function returns a valid kernel address on success or NULL on failure.
>> - *
>>   * Note: phys_to_virt(iommu_iova_to_phys(rproc->domain, da)) will work too,
>>   * but only on kernel direct mapped RAM memory. Instead, we're just using
>>   * here the output of the DMA API for the carveouts, which should be more
>>   * correct.
>> + *
>> + * Return: a valid kernel address on success or NULL on failure
>>   */
>>  void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>>  {
>> @@ -509,7 +509,7 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>>   * use RSC_DEVMEM resource entries to map their required @da to the physical
>>   * address of their base CMA region (ouch, hacky!).
>>   *
>> - * Returns 0 on success, or an appropriate error code otherwise
>> + * Return: 0 on success, or an appropriate error code otherwise
>>   */
>>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>  			     int offset, int avail)
>> @@ -644,7 +644,7 @@ void rproc_vdev_release(struct kref *ref)
>>   * support dynamically allocating this address using the generic
>>   * DMA API (but currently there isn't a use case for that).
>>   *
>> - * Returns 0 on success, or an appropriate error code otherwise
>> + * Return: 0 on success, or an appropriate error code otherwise
>>   */
>>  static int rproc_handle_trace(struct rproc *rproc, void *ptr,
>>  			      int offset, int avail)
>> @@ -721,6 +721,8 @@ static int rproc_handle_trace(struct rproc *rproc, void *ptr,
>>   * tell us ranges of physical addresses the firmware is allowed to request,
>>   * and not allow firmwares to request access to physical addresses that
>>   * are outside those ranges.
>> + *
>> + * Return: 0 on success, or an appropriate error code otherwise
>>   */
>>  static int rproc_handle_devmem(struct rproc *rproc, void *ptr,
>>  			       int offset, int avail)
>> @@ -783,6 +785,8 @@ static int rproc_handle_devmem(struct rproc *rproc, void *ptr,
>>   *
>>   * This function allocate specified memory entry @mem using
>>   * dma_alloc_coherent() as default allocator
>> + *
>> + * Return: 0 on success, or an appropriate error code otherwise
>>   */
>>  static int rproc_alloc_carveout(struct rproc *rproc,
>>  				struct rproc_mem_entry *mem)
>> @@ -889,6 +893,8 @@ static int rproc_alloc_carveout(struct rproc *rproc,
>>   *
>>   * This function releases specified memory entry @mem allocated via
>>   * rproc_alloc_carveout() function by @rproc.
>> + *
>> + * Return: 0 on success, or an appropriate error code otherwise
>>   */
>>  static int rproc_release_carveout(struct rproc *rproc,
>>  				  struct rproc_mem_entry *mem)
>> @@ -918,6 +924,8 @@ static int rproc_release_carveout(struct rproc *rproc,
>>   * (e.g. CMA) more efficiently, and also minimizes the number of TLB entries
>>   * needed to map it (in case @rproc is using an IOMMU). Reducing the TLB
>>   * pressure is important; it may have a substantial impact on performance.
>> + *
>> + * Return: 0 on success, or an appropriate error code otherwise
>>   */
>>  static int rproc_handle_carveout(struct rproc *rproc,
>>  				 void *ptr, int offset, int avail)
>> @@ -1006,6 +1014,8 @@ EXPORT_SYMBOL(rproc_add_carveout);
>>   *
>>   * This function allocates a rproc_mem_entry struct and fill it with parameters
>>   * provided by client.
>> + *
>> + * Return: a valid pointer on success, or NULL on failure
>>   */
>>  __printf(8, 9)
>>  struct rproc_mem_entry *
>> @@ -1050,6 +1060,8 @@ EXPORT_SYMBOL(rproc_mem_entry_init);
>>   *
>>   * This function allocates a rproc_mem_entry struct and fill it with parameters
>>   * provided by client.
>> + *
>> + * Return: a valid pointer on success, or NULL on failure
>>   */
>>  __printf(5, 6)
>>  struct rproc_mem_entry *
>> @@ -1881,6 +1893,8 @@ static int __rproc_detach(struct rproc *rproc)
>>   * remoteproc functional again.
>>   *
>>   * This function can sleep, so it cannot be called from atomic context.
>> + *
>> + * Return: 0 on success or a negative value upon failure
>>   */
>>  int rproc_trigger_recovery(struct rproc *rproc)
>>  {
>> @@ -1965,7 +1979,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>>   * If the remote processor is already powered on, this function immediately
>>   * returns (successfully).
>>   *
>> - * Returns 0 on success, and an appropriate error value otherwise.
>> + * Return: 0 on success, and an appropriate error value otherwise
>>   */
>>  int rproc_boot(struct rproc *rproc)
>>  {
>> @@ -2100,6 +2114,8 @@ EXPORT_SYMBOL(rproc_shutdown);
>>   * no longer available.  From there it should be possible to remove the
>>   * platform driver and even power cycle the application processor (if the HW
>>   * supports it) without needing to switch off the remote processor.
>> + *
>> + * Return: 0 on success, and an appropriate error value otherwise
>>   */
>>  int rproc_detach(struct rproc *rproc)
>>  {
>> @@ -2152,7 +2168,7 @@ EXPORT_SYMBOL(rproc_detach);
>>   * This function increments the remote processor's refcount, so always
>>   * use rproc_put() to decrement it back once rproc isn't needed anymore.
>>   *
>> - * Returns the rproc handle on success, and NULL on failure.
>> + * Return: rproc handle on success, and NULL on failure
>>   */
>>  #ifdef CONFIG_OF
>>  struct rproc *rproc_get_by_phandle(phandle phandle)
>> @@ -2302,8 +2318,6 @@ static int rproc_validate(struct rproc *rproc)
>>   * This is called by the platform-specific rproc implementation, whenever
>>   * a new remote processor device is probed.
>>   *
>> - * Returns 0 on success and an appropriate error code otherwise.
>> - *
>>   * Note: this function initiates an asynchronous firmware loading
>>   * context, which will look for virtio devices supported by the rproc's
>>   * firmware.
>> @@ -2311,6 +2325,8 @@ static int rproc_validate(struct rproc *rproc)
>>   * If found, those virtio devices will be created and added, so as a result
>>   * of registering this remote processor, additional virtio drivers might be
>>   * probed.
>> + *
>> + * Return: 0 on success and an appropriate error code otherwise
>>   */
>>  int rproc_add(struct rproc *rproc)
>>  {
>> @@ -2364,7 +2380,7 @@ static void devm_rproc_remove(void *rproc)
>>   * This function performs like rproc_add() but the registered rproc device will
>>   * automatically be removed on driver detach.
>>   *
>> - * Returns: 0 on success, negative errno on failure
>> + * Return: 0 on success, negative errno on failure
>>   */
>>  int devm_rproc_add(struct device *dev, struct rproc *rproc)
>>  {
>> @@ -2472,10 +2488,10 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>>   * implementations should then call rproc_add() to complete
>>   * the registration of the remote processor.
>>   *
>> - * On success the new rproc is returned, and on failure, NULL.
>> - *
>>   * Note: _never_ directly deallocate @rproc, even if it was not registered
>>   * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
>> + *
>> + * Return: new rproc pointer on success, and NULL on failure
>>   */
>>  struct rproc *rproc_alloc(struct device *dev, const char *name,
>>  			  const struct rproc_ops *ops,
>> @@ -2588,7 +2604,7 @@ EXPORT_SYMBOL(rproc_put);
>>   * of the outstanding reference created by rproc_alloc. To decrement that
>>   * one last refcount, one still needs to call rproc_free().
>>   *
>> - * Returns 0 on success and -EINVAL if @rproc isn't valid.
>> + * Return: 0 on success and -EINVAL if @rproc isn't valid
>>   */
>>  int rproc_del(struct rproc *rproc)
>>  {
>> @@ -2635,7 +2651,7 @@ static void devm_rproc_free(struct device *dev, void *res)
>>   * This function performs like rproc_alloc() but the acquired rproc device will
>>   * automatically be released on driver detach.
>>   *
>> - * Returns: new rproc instance, or NULL on failure
>> + * Return: new rproc instance, or NULL on failure
>>   */
>>  struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
>>  			       const struct rproc_ops *ops,
>> @@ -2687,7 +2703,7 @@ EXPORT_SYMBOL(rproc_remove_subdev);
>>   * rproc_get_by_child() - acquire rproc handle of @dev's ancestor
>>   * @dev:	child device to find ancestor of
>>   *
>> - * Returns the ancestor rproc instance, or NULL if not found.
>> + * Return: the ancestor rproc instance, or NULL if not found
>>   */
>>  struct rproc *rproc_get_by_child(struct device *dev)
>>  {
>> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
>> index 11423588965a..469c52e62faf 100644
>> --- a/drivers/remoteproc/remoteproc_elf_loader.c
>> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
>> @@ -31,6 +31,8 @@
>>   * @fw: the ELF firmware image
>>   *
>>   * Make sure this fw image is sane (ie a correct ELF32/ELF64 file).
>> + *
>> + * Return: 0 on success and -EINVAL upon any failure
>>   */
>>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>>  {
>> @@ -117,11 +119,11 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
>>   * @rproc: the remote processor handle
>>   * @fw: the ELF firmware image
>>   *
>> - * This function returns the entry point address of the ELF
>> - * image.
>> - *
>>   * Note that the boot address is not a configurable property of all remote
>>   * processors. Some will always boot at a specific hard-coded address.
>> + *
>> + * Return: entry point address of the ELF image
>> + *
>>   */
>>  u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>>  {
>> @@ -152,6 +154,8 @@ EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>>   * might be different: they might not have iommus, and would prefer to
>>   * directly allocate memory for every segment/resource. This is not yet
>>   * supported, though.
>> + *
>> + * Return: 0 on success and an appropriate error code otherwise
>>   */
>>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>>  {
>> @@ -362,7 +366,7 @@ EXPORT_SYMBOL(rproc_elf_load_rsc_table);
>>   * This function finds the location of the loaded resource table. Don't
>>   * call this function if the table wasn't loaded yet - it's a bug if you do.
>>   *
>> - * Returns the pointer to the resource table if it is found or NULL otherwise.
>> + * Return: pointer to the resource table if it is found or NULL otherwise.
> 
> Here the '.' has been kept while it was remove for all of the above.  I don't
> know that the right guidelines are for this. 
> 
>>   * If the table wasn't loaded yet the result is unspecified.
>>   */
>>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>> index 0cc617f76068..cf4d54e98e6a 100644
>> --- a/drivers/remoteproc/remoteproc_virtio.c
>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>> @@ -45,7 +45,7 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
>>   * when the remote processor signals that a specific virtqueue has pending
>>   * messages available.
>>   *
>> - * Returns IRQ_NONE if no message was found in the @notifyid virtqueue,
>> + * Return: IRQ_NONE if no message was found in the @notifyid virtqueue,
>>   * and otherwise returns IRQ_HANDLED.
> 
> Same
> 
>>   */
>>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int notifyid)
>> @@ -325,7 +325,7 @@ static void rproc_virtio_dev_release(struct device *dev)
>>   * This function registers a virtio device. This vdev's partent is
>>   * the rproc device.
>>   *
>> - * Returns 0 on success or an appropriate error value otherwise.
>> + * Return: 0 on success or an appropriate error value otherwise
>>   */
>>  int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>>  {
>> @@ -432,6 +432,8 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>>   * @data: must be null
>>   *
>>   * This function unregisters an existing virtio device.
>> + *
>> + * Return: 0
>>   */
>>  int rproc_remove_virtio_dev(struct device *dev, void *data)
>>  {
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 8b795b544f75..42a1f30e33a7 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -243,7 +243,7 @@ struct fw_rsc_trace {
>>   * @da: device address
>>   * @align: the alignment between the consumer and producer parts of the vring
>>   * @num: num of buffers supported by this vring (must be power of two)
>> - * @notifyid is a unique rproc-wide notify index for this vring. This notify
>> + * @notifyid: a unique rproc-wide notify index for this vring. This notify
>>   * index is used when kicking a remote processor, to let it know that this
>>   * vring is triggered.
>>   * @pa: physical address
>> @@ -266,18 +266,18 @@ struct fw_rsc_vdev_vring {
>>  /**
>>   * struct fw_rsc_vdev - virtio device header
>>   * @id: virtio device id (as in virtio_ids.h)
>> - * @notifyid is a unique rproc-wide notify index for this vdev. This notify
>> + * @notifyid: a unique rproc-wide notify index for this vdev. This notify
>>   * index is used when kicking a remote processor, to let it know that the
>>   * status/features of this vdev have changes.
>> - * @dfeatures specifies the virtio device features supported by the firmware
>> - * @gfeatures is a place holder used by the host to write back the
>> + * @dfeatures: specifies the virtio device features supported by the firmware
>> + * @gfeatures: a place holder used by the host to write back the
>>   * negotiated features that are supported by both sides.
>> - * @config_len is the size of the virtio config space of this vdev. The config
>> + * @config_len: the size of the virtio config space of this vdev. The config
>>   * space lies in the resource table immediate after this vdev header.
>> - * @status is a place holder where the host will indicate its virtio progress.
>> - * @num_of_vrings indicates how many vrings are described in this vdev header
>> + * @status: a place holder where the host will indicate its virtio progress.
>> + * @num_of_vrings: indicates how many vrings are described in this vdev header
>>   * @reserved: reserved (must be zero)
>> - * @vring is an array of @num_of_vrings entries of 'struct fw_rsc_vdev_vring'.
>> + * @vring: an array of @num_of_vrings entries of 'struct fw_rsc_vdev_vring'.
>>   *
>>   * This resource is a virtio device header: it provides information about
>>   * the vdev, and is then used by the host and its peer remote processors
>> @@ -287,16 +287,17 @@ struct fw_rsc_vdev_vring {
>>   * to statically allocate a vdev upon registration of the rproc (dynamic vdev
>>   * allocation is not yet supported).
>>   *
>> - * Note: unlike virtualization systems, the term 'host' here means
>> - * the Linux side which is running remoteproc to control the remote
>> - * processors. We use the name 'gfeatures' to comply with virtio's terms,
>> - * though there isn't really any virtualized guest OS here: it's the host
>> - * which is responsible for negotiating the final features.
>> - * Yeah, it's a bit confusing.
>> - *
>> - * Note: immediately following this structure is the virtio config space for
>> - * this vdev (which is specific to the vdev; for more info, read the virtio
>> - * spec). the size of the config space is specified by @config_len.
>> + * Note:
>> + * 1. unlike virtualization systems, the term 'host' here means
>> + *    the Linux side which is running remoteproc to control the remote
>> + *    processors. We use the name 'gfeatures' to comply with virtio's terms,
>> + *    though there isn't really any virtualized guest OS here: it's the host
>> + *    which is responsible for negotiating the final features.
>> + *    Yeah, it's a bit confusing.
>> + *
>> + * 2. immediately following this structure is the virtio config space for
>> + *    this vdev (which is specific to the vdev; for more info, read the virtio
>> + *    spec). the size of the config space is specified by @config_len.
> 
> s/the/The
> 
>>   */
>>  struct fw_rsc_vdev {
>>  	u32 id;
>> @@ -440,7 +441,7 @@ enum rproc_state {
>>   * enum rproc_crash_type - remote processor crash types
>>   * @RPROC_MMUFAULT:	iommu fault
>>   * @RPROC_WATCHDOG:	watchdog bite
>> - * @RPROC_FATAL_ERROR	fatal error
>> + * @RPROC_FATAL_ERROR:	fatal error
>>   *
>>   * Each element of the enum is used as an array index. So that, the value of
>>   * the elements should be always something sane.
>> @@ -457,9 +458,9 @@ enum rproc_crash_type {
>>   * enum rproc_dump_mechanism - Coredump options for core
>>   * @RPROC_COREDUMP_DISABLED:	Don't perform any dump
>>   * @RPROC_COREDUMP_ENABLED:	Copy dump to separate buffer and carry on with
>> -				recovery
>> + *				recovery
>>   * @RPROC_COREDUMP_INLINE:	Read segments directly from device memory. Stall
>> -				recovery until all segments are read
>> + *				recovery until all segments are read
>>   */
>>  enum rproc_dump_mechanism {
>>  	RPROC_COREDUMP_DISABLED,
>> @@ -475,6 +476,7 @@ enum rproc_dump_mechanism {
>>   * @priv:	private data associated with the dump_segment
>>   * @dump:	custom dump function to fill device memory segment associated
>>   *		with coredump
>> + * @offset:	offset of the segment
>>   */
>>  struct rproc_dump_segment {
>>  	struct list_head node;
>> @@ -524,7 +526,9 @@ struct rproc_dump_segment {
>>   * @auto_boot: flag to indicate if remote processor should be auto-started
>>   * @dump_segments: list of segments in the firmware
>>   * @nb_vdev: number of vdev currently handled by rproc
>> - * @char_dev: character device of the rproc
>> + * @elf_class: firmware ELF class
>> + * @elf_machine: firmware ELF machine
>> + * @cdev: character device of the rproc
>>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>>   */
>>  struct rproc {
>> @@ -613,10 +617,10 @@ struct rproc_vring {
>>   * struct rproc_vdev - remoteproc state for a supported virtio device
>>   * @refcount: reference counter for the vdev and vring allocations
>>   * @subdev: handle for registering the vdev as a rproc subdevice
>> + * @dev: device struct used for reference count semantics
>>   * @id: virtio device id (as in virtio_ids.h)
>>   * @node: list node
>>   * @rproc: the rproc handle
>> - * @vdev: the virio device
>>   * @vring: the vrings for this vdev
>>   * @rsc_offset: offset of the vdev's resource entry
>>   * @index: vdev position versus other vdev declared in resource table
> 
> With or without the above:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks Mathieu.

Bjorn,
Any preferences, let me know if you want me to quickly respin this patch, or if
you want to fixup locally while applying?

regards
Suman
