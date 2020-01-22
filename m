Date: Tue, 21 Jan 2020 16:15:40 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH RESEND 0/2] Some improvements for Qualcomm hwspinlock
Message-ID: <20200122001538.GB14744@builder>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
To: Baolin Wang <baolin.wang7@gmail.com>
Cc: agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 07 Jan 19:09 PST 2020, Baolin Wang wrote:

> This patch set did some optimization for Qualcomm hwlock controller,
> including using devm_hwspin_lock_register() API to simplify code and
> removing redundant pm runtime functions.
> 

Applied, thanks!

> Baolin Wang (2):
>   hwspinlock: qcom: Remove redundant PM runtime functions
>   hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock
>     controller
> 
>  drivers/hwspinlock/qcom_hwspinlock.c |   28 ++--------------------------
>  1 file changed, 2 insertions(+), 26 deletions(-)
> 
> -- 
> 1.7.9.5
> 
