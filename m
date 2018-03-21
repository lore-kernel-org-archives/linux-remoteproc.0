Return-Path: <david@lechnology.com>
Subject: Re: [PATCH 3/8] ARM: davinci: dts: add a reset control to the dsp
 node
References: <20180321120807.18032-1-brgl@bgdev.pl>
 <20180321120807.18032-4-brgl@bgdev.pl>
 <CAMRc=MePv9GAApdzW9+i_xW9j6-ydBY_Wfb1Hmphsvzn9waGnQ@mail.gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <2394c1e2-b1a7-9674-c017-ed71d613675e@lechnology.com>
Date: Wed, 21 Mar 2018 11:07:59 -0500
MIME-Version: 1.0
In-Reply-To: <CAMRc=MePv9GAApdzW9+i_xW9j6-ydBY_Wfb1Hmphsvzn9waGnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 03/21/2018 09:04 AM, Bartosz Golaszewski wrote:
> 2018-03-21 13:08 GMT+01:00 Bartosz Golaszewski <brgl@bgdev.pl>:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> The davinci-rproc driver will soon use the reset framework. Add the
>> resets property to the dsp node in da850.dtsi.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>   arch/arm/boot/dts/da850.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
>> index 89af749c5b6f..5b485e44b83e 100644
>> --- a/arch/arm/boot/dts/da850.dtsi
>> +++ b/arch/arm/boot/dts/da850.dtsi
>> @@ -124,6 +124,7 @@
>>                          compatible = "ti,da850-psc0";
>>                          reg = <0x10000 0x1000>;
>>                          #clock-cells = <1>;
>> +                       #reset-cells = <1>;
>>                          #power-domain-cells = <1>;
>>                          clocks = <&pll0_sysclk 1>, <&pll0_sysclk 2>,
>>                                   <&pll0_sysclk 4>, <&pll0_sysclk 6>,
>> --
>> 2.16.1
>>
> 
> I noticed I mixed up the descriptions in patches 2/8 and 3/8. It'll
> need a v2, but I'll wait for some reviews first.
> 
> Bart
> 

Yes, and this patch should be first to avoid a possible compiler warning.
