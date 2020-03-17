Return-Path: <davem@davemloft.net>
Date: Mon, 16 Mar 2020 17:38:28 -0700 (PDT)
Message-Id: <20200316.173828.1870893600981787445.davem@davemloft.net>
Subject: Re: [PATCH v2] remoteproc: clean up notification config
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200316225121.29905-1-elder@linaro.org>
References: <20200316225121.29905-1-elder@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
To: elder@linaro.org
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Alex Elder <elder@linaro.org>
Date: Mon, 16 Mar 2020 17:51:21 -0500

> Rearrange the config files for remoteproc and IPA to fix their
> interdependencies.
> 
> First, have CONFIG_QCOM_Q6V5_MSS select QCOM_Q6V5_IPA_NOTIFY so the
> notification code is built regardless of whether IPA needs it.
> 
> Next, represent QCOM_IPA as being dependent on QCOM_Q6V5_MSS rather
> than setting its value to match QCOM_Q6V5_COMMON (which is selected
> by QCOM_Q6V5_MSS).
> 
> Drop all dependencies from QCOM_Q6V5_IPA_NOTIFY.  The notification
> code will be built whenever QCOM_Q6V5_MSS is set, and it has no other
> dependencies.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
> v2: - Fix subject line
>     - Incorporate a change I thought I had already squashed

Applied to net-next, thanks.
