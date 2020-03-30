Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 02/17] remoteproc: Introduce function
 rproc_set_mcu_sync_state()
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-3-mathieu.poirier@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <1ae43f43-33b9-94aa-06a4-771780c6d7aa@ti.com>
Date: Mon, 30 Mar 2020 17:55:35 -0500
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-3-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> Introduce function rproc_set_mcu_sync_state() to set the synchronisation
> state of the MCU at various stages of the lifecycle process.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_internal.h | 38 ++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 5c93de5e00bb..73ea32df0156 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -24,6 +24,26 @@ struct rproc_debug_trace {
>  	struct rproc_mem_entry trace_mem;
>  };
>  
> +/*
> + * enum rproc_sync_states - remote processsor sync states
> + * @RPROC_SYNC_STATE_INIT	state to use when the remoteproc core
> + *				is initialising.
> + * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
> + *				has shutdown (rproc_shutdown()) the MCU.
> + * @RPROC_SYNC_STATE_CRASHED	state to use after the MCU has crashed but
> + *				has not been recovered by the remoteproc
> + *				core yet.
> + *
> + * Keeping these separate from the enum rproc_state in order to avoid
> + * introducing coupling between the state of the MCU and the synchronisation
> + * operation to use.
> + */
> +enum rproc_mcu_sync_states {
> +	RPROC_SYNC_STATE_INIT,
> +	RPROC_SYNC_STATE_SHUTDOWN,
> +	RPROC_SYNC_STATE_CRASHED,
> +};
> +

Perhaps rename the enum as rproc_sync_state

>  /* from remoteproc_core.c */
>  void rproc_release(struct kref *kref);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> @@ -68,6 +88,24 @@ static inline bool rproc_sync_with_mcu(struct rproc *rproc)
>  	return rproc->sync_with_mcu;
>  }
>  
> +static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
> +					    unsigned int state)

Change the argument type to the above enum, and perhaps rename the
function to use flags instead of state.

regards
Suman


> +{
> +	switch (state) {
> +	case RPROC_SYNC_STATE_INIT:
> +		rproc->sync_with_mcu = rproc->sync_states->on_init;
> +		break;
> +	case RPROC_SYNC_STATE_SHUTDOWN:
> +		rproc->sync_with_mcu = rproc->sync_states->after_stop;
> +		break;
> +	case RPROC_SYNC_STATE_CRASHED:
> +		rproc->sync_with_mcu = rproc->sync_states->after_crash;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static inline
>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  {
> 
