Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 9 Oct 2018 22:32:06 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 12/17] remoteproc: modify vring allocation to rely on
 centralized carveout allocator
Message-ID: <20181010053206.GA20016@builder>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-13-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532697292-14272-13-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 27 Jul 06:14 PDT 2018, Loic Pallardy wrote:
>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
[..]
> @@ -114,6 +122,10 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
>  	rvring->vq = vq;
>  	vq->priv = rvring;
>  
> +	/* Update vring in resource table */
> +	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
> +	rsc->vring[id].da = mem->da;
> +

This would now happen after we've started the remoteproc. Don't we need
to do this in-between allocating the carveouts and booting the
remoteproc?

Regards,
Bjorn
