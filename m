Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 01/17] remoteproc: Add new operation and state machine
 for MCU synchronisation
From: Suman Anna <s-anna@ti.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-2-mathieu.poirier@linaro.org>
 <3eaede13-533d-f2ba-fc14-96b135479b7e@ti.com>
Message-ID: <aff2d75d-9480-385f-c089-c0f8cb982feb@ti.com>
Date: Mon, 30 Mar 2020 17:49:11 -0500
MIME-Version: 1.0
In-Reply-To: <3eaede13-533d-f2ba-fc14-96b135479b7e@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 3/30/20 5:46 PM, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/24/20 4:45 PM, Mathieu Poirier wrote:
>> Add a new rproc_ops sync_ops to support use cases where the remoteproc
>> core is synchronisting with the MCU.  When exactly to use the sync_ops is
> 
> typo on syschronisting..
> 
>> directed by the states in struct rproc_sync_states.
>>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/remoteproc/remoteproc_debugfs.c  | 31 ++++++++++++++++++++++++
>>  drivers/remoteproc/remoteproc_internal.h |  5 ++++
>>  include/linux/remoteproc.h               | 23 +++++++++++++++++-
>>  3 files changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
>> index dd93cf04e17f..187bcc67f997 100644
>> --- a/drivers/remoteproc/remoteproc_debugfs.c
>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
>> @@ -311,6 +311,35 @@ static const struct file_operations rproc_carveouts_ops = {
>>  	.release	= single_release,
>>  };
>>  
>> +/* Expose synchronisation states via debugfs */
>> +static int rproc_sync_states_show(struct seq_file *seq, void *p)
>> +{
>> +	struct rproc *rproc = seq->private;
>> +
>> +	seq_printf(seq, "Sync with MCU: %s\n",
>> +		   rproc->sync_with_mcu ? "true" : "false");
>> +	seq_printf(seq, "On init: %s\n",
>> +		   rproc->sync_states->on_init ? "true" : "false");
>> +	seq_printf(seq, "After stop: %s\n",
>> +		   rproc->sync_states->after_stop ? "true" : "false");
>> +	seq_printf(seq, "After crash: %s\n",
>> +		   rproc->sync_states->after_crash ? "true" : "false");
>> +
>> +	return 0;
>> +}
>> +
>> +static int rproc_sync_states_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, rproc_sync_states_show, inode->i_private);
>> +}
>> +
>> +static const struct file_operations rproc_sync_states_ops = {
>> +	.open		= rproc_sync_states_open,
>> +	.read		= seq_read,
>> +	.llseek		= seq_lseek,
>> +	.release	= single_release,
>> +};
>> +
>>  void rproc_remove_trace_file(struct dentry *tfile)
>>  {
>>  	debugfs_remove(tfile);
>> @@ -357,6 +386,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
>>  			    rproc, &rproc_rsc_table_ops);
>>  	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
>>  			    rproc, &rproc_carveouts_ops);
>> +	debugfs_create_file("sync_states", 0400, rproc->dbg_dir,
>> +			    rproc, &rproc_sync_states_ops);
>>  }
>>  
>>  void __init rproc_init_debugfs(void)
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 493ef9262411..5c93de5e00bb 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -63,6 +63,11 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>>  struct rproc_mem_entry *
>>  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>>  
>> +static inline bool rproc_sync_with_mcu(struct rproc *rproc)
>> +{
>> +	return rproc->sync_with_mcu;
>> +}
>> +
> 
> Since you are using this mostly for checking and as a boolean, I suggest
> you rename this appropriately, something like rproc_needs_sync,
> rproc_has_sync or rproc_uses_sync().
> 
> And I am wondering if it is actually better to introduce the sync state
> to check against here, rather than using the stored sync state and
> return. The current way makes it confusing to read the state machine.
> 
>>  static inline
>>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>>  {
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 16ad66683ad0..d115e47d702d 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -353,6 +353,21 @@ enum rsc_handling_status {
>>  	RSC_IGNORED	= 1,
>>  };
>>  
>> +/**
>> + * struct rproc_sync_states - platform specific states indicating which
>> + *			      rproc_ops to use at specific times during
>> + *			      the MCU lifecycle.
>> + * @on_init: true if synchronising with MCU at system initialisation time
>> + * @after_stop: true if synchronising with MCU after stopped from the
>> + *		command line
>> + * @after_crash: true if synchonising with MCU after the MCU has crashed
>> + */
>> +struct rproc_sync_states {
>> +	bool on_init;
>> +	bool after_stop;
>> +	bool after_crash;
>> +};
>> +
> 
> Overall, this patch can move down the order, and better to add it in
> the patches where you actually introduce these code. And the debugfs
> pieces can be added as a separate patch by itself.

Also, actually sounds more like flags than states..

regards
Suman

> 
>>  /**
>>   * struct rproc_ops - platform-specific device handlers
>>   * @start:	power on the device and boot it
>> @@ -456,6 +471,9 @@ struct rproc_dump_segment {
>>   * @firmware: name of firmware file to be loaded
>>   * @priv: private data which belongs to the platform-specific rproc module
>>   * @ops: platform-specific start/stop rproc handlers
>> + * @sync_ops: paltform-specific start/stop rproc handlers when
> 
> typo on platform
> 
>> + *	      synchronising with a remote processor.
>> + * @sync_states: Determine the rproc_ops to choose in specific states.
>>   * @dev: virtual device for refcounting and common remoteproc behavior
>>   * @power: refcount of users who need this rproc powered up
>>   * @state: state of the device
>> @@ -479,6 +497,7 @@ struct rproc_dump_segment {
>>   * @table_sz: size of @cached_table
>>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>>   * @auto_boot: flag to indicate if remote processor should be auto-started
>> + * @sync_with_mcu: true if currently synchronising with MCU
>>   * @dump_segments: list of segments in the firmware
>>   * @nb_vdev: number of vdev currently handled by rproc
>>   */
>> @@ -488,7 +507,8 @@ struct rproc {
>>  	const char *name;
>>  	char *firmware;
>>  	void *priv;
>> -	struct rproc_ops *ops;
>> +	struct rproc_ops *ops, *sync_ops;
> 
> Nothing wrong with this, but prefer to have the new variable in a new
> line for better readability.
> 
> regards
> Suman
> 
>> +	struct rproc_sync_states *sync_states;
>>  	struct device dev;
>>  	atomic_t power;
>>  	unsigned int state;
>> @@ -512,6 +532,7 @@ struct rproc {
>>  	size_t table_sz;
>>  	bool has_iommu;
>>  	bool auto_boot;
>> +	bool sync_with_mcu;
>>  	struct list_head dump_segments;
>>  	int nb_vdev;
>>  };
>>
> 
