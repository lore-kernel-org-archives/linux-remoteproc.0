Date: Fri, 4 Oct 2019 21:01:42 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/3] Optimize the u8500_hsem hwlock driver
Message-ID: <20191005040139.GA5189@tuxbook-pro>
References: <cover.1569572448.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
To: Baolin Wang <baolin.wang@linaro.org>
Cc: linus.walleij@linaro.org, ohad@wizery.com, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 27 Sep 01:27 PDT 2019, Baolin Wang wrote:

> This patch set did some Optimization with changing to use devm_xxx()
> APIs to simplify the code and make code more readable.
> 

Applied, with Linus' r-b

Thanks,
Bjorn

> Baolin Wang (3):
>   hwspinlock: u8500_hsem: Change to use
>     devm_platform_ioremap_resource()
>   hwspinlock: u8500_hsem: Use devm_kzalloc() to allocate memory
>   hwspinlock: u8500_hsem: Use devm_hwspin_lock_register() to register
>     hwlock controller
> 
>  drivers/hwspinlock/u8500_hsem.c |   46 +++++++++++----------------------------
>  1 file changed, 13 insertions(+), 33 deletions(-)
> 
> -- 
> 1.7.9.5
> 
