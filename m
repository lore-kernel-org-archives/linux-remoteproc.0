Date: Tue, 21 Jan 2020 16:17:05 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH RESEND 0/3] Some improvements for SIRF hwspinlock
Message-ID: <20200122001703.GD14744@builder>
References: <cover.1578453662.git.baolin.wang7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1578453662.git.baolin.wang7@gmail.com>
To: Baolin Wang <baolin.wang7@gmail.com>
Cc: ohad@wizery.com, baohua@kernel.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 07 Jan 19:23 PST 2020, Baolin Wang wrote:

> This patch set did some improvements for the SIRF hwspinlock driver,
> including changing to use devm_xxx APIs and removing some redundant
> pm runtime functions.
> 

Thanks for resending the three series' Baolin! I've applied this as
well.

Regards,
Bjorn

> Baolin Wang (3):
>   hwspinlock: sirf: Change to use devm_platform_ioremap_resource()
>   hwspinlock: sirf: Remove redundant PM runtime functions
>   hwspinlock: sirf: Use devm_hwspin_lock_register() to register hwlock
>     controller
> 
>  drivers/hwspinlock/sirf_hwspinlock.c |   46 ++++++----------------------------
>  1 file changed, 7 insertions(+), 39 deletions(-)
> 
> -- 
> 1.7.9.5
> 
