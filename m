Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 3 Oct 2018 17:31:34 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/5] rpmsg: wakeup poll to notify signal update
Message-ID: <20181004003134.GV2523@minitux>
References: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
 <1538566463-24627-5-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538566463-24627-5-git-send-email-aneela@codeaurora.org>
To: Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc: ohad@wizery.com, clew@codeaurora.org, sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 03 Oct 04:34 PDT 2018, Arun Kumar Neelakantam wrote:

> Add support to wait on poll to get signal notifications.
> Send POLLPRI mask to indicate the signal change.
> 
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  drivers/rpmsg/rpmsg_char.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index c983d6c..aee5561 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -64,6 +64,7 @@ struct rpmsg_ctrldev {
>   * @queue_lock:	synchronization of @queue operations
>   * @queue:	incoming message queue
>   * @readq:	wait object for incoming queue
> + * @sig_pending:state of signal notification
>   */
>  struct rpmsg_eptdev {
>  	struct device dev;
> @@ -78,6 +79,8 @@ struct rpmsg_eptdev {
>  	spinlock_t queue_lock;
>  	struct sk_buff_head queue;
>  	wait_queue_head_t readq;
> +
> +	atomic_t sig_pending;
>  };
>  
>  static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> @@ -125,6 +128,12 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>  static int rpmsg_sigs_cb(struct rpmsg_device *rpdev, void *priv,
>  			 u32 old, u32 new)
>  {
> +	struct rpmsg_eptdev *eptdev = priv;
> +
> +	atomic_set(&eptdev->sig_pending, 1);
> +
> +	/* wake up any blocking processes, waiting for signal notification */
> +	wake_up_interruptible(&eptdev->readq);

This will execute a full memory barrier, so you shouldn't need to use
atomic_t to carry this information.

>  	return 0;
>  }
>  

The rest looks good.

Regards,
Bjorn
