Return-Path: <bjorn.andersson@linaro.org>
Date: Sat, 29 Jun 2019 21:08:28 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/2] hwspinlock: add the 'in_atomic' API
Message-ID: <20190630040828.GB1263@builder>
References: <1551974303-24542-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551974303-24542-1-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>, linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Alexandre Torgue <alexandre.torgue@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 07 Mar 07:58 PST 2019, Fabien Dessenne wrote:

> In its current implementation, the hwspinlock framework relies on jiffies
> to handle the timeout of the hwspin_lock_timeout_xxx() API.
> In an atomic context (or more precisely when irq are disabled) jiffies does not
> increase, which prevents the timeout to reach its target value (infinite loop).
> 
> Note that there is already an hwspinlock user that runs in atomic context
> (drivers/irqchip/irq-stm32-exti.c) and that has to handle by itself the
> timeout.
> 
> The first patch of the series completes the Documentation (the 'raw' API
> is not documented), and the second patch provides with the 'in_atomic' API.
> 

Applied

Thanks,
Bjorn

> Fabien Dessenne (2):
>   hwspinlock: document the hwspinlock 'raw' API
>   hwspinlock: add the 'in_atomic' API
> 
>  Documentation/hwspinlock.txt         | 81 ++++++++++++++++++++++++++++++++++++
>  drivers/hwspinlock/hwspinlock_core.c | 43 +++++++++++++------
>  include/linux/hwspinlock.h           | 61 +++++++++++++++++++++++++--
>  3 files changed, 169 insertions(+), 16 deletions(-)
> 
> -- 
> 2.7.4
> 
