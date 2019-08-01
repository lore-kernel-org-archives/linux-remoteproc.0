Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 1 Aug 2019 12:14:03 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/6] hwspinlock: allow sharing of hwspinlocks
Message-ID: <20190801191403.GA7234@tuxbook-pro>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 13 Mar 08:50 PDT 2019, Fabien Dessenne wrote:

> The current implementation does not allow two different devices to use
> a common hwspinlock. This patch set proposes to have, as an option, some
> hwspinlocks shared between several users.
> 
> Below is an example that explain the need for this:
> 	exti: interrupt-controller@5000d000 {
> 		compatible = "st,stm32mp1-exti", "syscon";
> 		interrupt-controller;
> 		#interrupt-cells = <2>;
> 		reg = <0x5000d000 0x400>;
> 		hwlocks = <&hsem 1>;
> 	};
> The two drivers (stm32mp1-exti and syscon) refer to the same hwlock.
> With the current hwspinlock implementation, only the first driver succeeds
> in requesting (hwspin_lock_request_specific) the hwlock. The second request
> fails.
> 
> 
> The proposed approach does not modify the API, but extends the DT 'hwlocks'
> property with a second optional parameter (the first one identifies an
> hwlock) that specifies whether an hwlock is requested for exclusive usage
> (current behavior) or can be shared between several users.
> Examples:
> 	hwlocks = <&hsem 8>;	Ref to hwlock #8 for exclusive usage
> 	hwlocks = <&hsem 8 0>;	Ref to hwlock #8 for exclusive (0) usage
> 	hwlocks = <&hsem 8 1>;	Ref to hwlock #8 for shared (1) usage
> 
> As a constraint, the #hwlock-cells value must be 1 or 2.
> In the current implementation, this can have theorically any value but:
> - all of the exisiting drivers use the same value : 1.
> - the framework supports only one value : 1 (see implementation of
>   of_hwspin_lock_simple_xlate())
> Hence, it shall not be a problem to restrict this value to 1 or 2 since
> it won't break any driver.
> 

Hi Fabien,

Your series looks good, but it makes me wonder why the hardware locks
should be an exclusive resource.

How about just making all (specific) locks shared?

Regards,
Bjorn

> Fabien Dessenne (6):
>   dt-bindings: hwlock: add support of shared locks
>   hwspinlock: allow sharing of hwspinlocks
>   dt-bindings: hwlock: update STM32 #hwlock-cells value
>   ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
>   ARM: dts: stm32: Add hwlock for irqchip on stm32mp157
>   ARM: dts: stm32: hwlocks for GPIO for stm32mp157
> 
>  .../devicetree/bindings/hwlock/hwlock.txt          | 27 +++++--
>  .../bindings/hwlock/st,stm32-hwspinlock.txt        |  6 +-
>  Documentation/hwspinlock.txt                       | 10 ++-
>  arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |  2 +
>  arch/arm/boot/dts/stm32mp157c.dtsi                 | 10 +++
>  drivers/hwspinlock/hwspinlock_core.c               | 82 +++++++++++++++++-----
>  drivers/hwspinlock/hwspinlock_internal.h           |  2 +
>  7 files changed, 108 insertions(+), 31 deletions(-)
> 
> -- 
> 2.7.4
> 
