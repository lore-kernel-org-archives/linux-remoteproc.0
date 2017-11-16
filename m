Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 15 Nov 2017 21:42:52 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/5] soc: qcom: Introduce QMI encoder/decoder
Message-ID: <20171116054252.GK28761@minitux>
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115201012.25892-2-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 15 Nov 12:10 PST 2017, Bjorn Andersson wrote:
> diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
[..]
> +void *qmi_encode_message(int type, unsigned int msg_id, size_t *len,
> +			 unsigned int txn_id, struct qmi_elem_info *ei,
> +			 const void *c_struct)
> +{
> +	struct qmi_header *hdr;
> +	ssize_t msglen = 0;
> +	void *msg;
> +	int ret;
> +
> +	/* Check the possibility of a zero length QMI message */
> +	if (!c_struct) {
> +		ret = qmi_calc_min_msg_len(ei, 1);
> +		if (ret) {
> +			pr_err("%s: Calc. len %d != 0, but NULL c_struct\n",
> +			       __func__, ret);
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +
> +	msg = kzalloc(sizeof(*hdr) + *len, GFP_KERNEL);
> +	if (!msg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	msglen = qmi_encode(ei, msg + sizeof(*hdr), c_struct, *len, 1);
> +	if (msglen < 0) {
> +		kfree(msg);
> +		return ERR_PTR(msglen);
> +	}

Talked to Chris Lew about this earlier today;

The check above implies that it's valid to call this function with a
valid ei of minimum message length of 0 and c_struct being NULL. But the
call to qmi_encdec() will dereference c_struct in order to know that the
optional elements described in ei are unset.

So the call to qmi_encode() needs to only be done conditionally on
c_struct being non-NULL, logically interpreting c_struct being NULL as
all optional fields are unset.

Will post an update with this fixed.

> +
> +	hdr = msg;
> +	hdr->type = type;
> +	hdr->txn_id = txn_id;
> +	hdr->msg_id = msg_id;
> +	hdr->msg_len = msglen;
> +
> +	*len = sizeof(*hdr) + msglen;
> +
> +	return msg;
> +}
> +EXPORT_SYMBOL(qmi_encode_message);

Regards,
Bjorn
