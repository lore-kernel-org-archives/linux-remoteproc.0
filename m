Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 18 Jan 2017 23:08:58 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: char: add CONFIG_NET dependency
Message-ID: <20170119070858.GA17008@builder>
References: <20170119145503.556971-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170119145503.556971-1-arnd@arndb.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 19 Jan 06:54 PST 2017, Arnd Bergmann wrote:

> Without CONFIG_NET, we get a build failure for the new driver:
> 
> ERROR: "skb_queue_tail" [drivers/rpmsg/rpmsg_char.ko] undefined!
> ERROR: "skb_put" [drivers/rpmsg/rpmsg_char.ko] undefined!
> ERROR: "__alloc_skb" [drivers/rpmsg/rpmsg_char.ko] undefined!
> ERROR: "kfree_skb" [drivers/rpmsg/rpmsg_char.ko] undefined!
> ERROR: "skb_dequeue" [drivers/rpmsg/rpmsg_char.ko] undefined!
> 
> This adds a dependency so we don't try to build the broken configuration.
> 
> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied

Thanks,
Bjorn
