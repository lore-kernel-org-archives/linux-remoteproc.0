Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v2 2/5] soc: qcom: Introduce QMI helpers
References: <20171107052042.22569-1-bjorn.andersson@linaro.org>
 <20171107052042.22569-3-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <858b59b9-6bff-6ed9-fd25-e35cbeec8aec@codeaurora.org>
Date: Wed, 8 Nov 2017 13:40:29 -0800
MIME-Version: 1.0
In-Reply-To: <20171107052042.22569-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

Found a minor typo.

On 11/6/2017 9:20 PM, Bjorn Andersson wrote:

[..]
> +ssize_t qmi_send_indication(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> +			    int msg_id, size_t len, struct qmi_elem_info *ei,
> +			    const void *c_struct)
> +{
> +	struct qmi_txn txn;
> +	ssize_t rval;
> +	int ret;
> +
> +	ret = qmi_txn_init(qmi, &txn, NULL, NULL);
> +	if (ret < 0)
> +		return ret;;

Double semi colon on ret.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
