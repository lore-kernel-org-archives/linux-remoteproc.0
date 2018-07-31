Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v7 1/4] remoteproc/davinci: use the reset framework
References: <20180621073706.22812-1-brgl@bgdev.pl>
 <20180621073706.22812-2-brgl@bgdev.pl> <20180731042539.GE5090@builder>
 <CAMRc=MdwCruRZ_EQ3Pzq-=HdhiA6pfSZczRKMa5i9Rju0JgHig@mail.gmail.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <c3484965-1efe-2425-86e0-ecb78ea189dd@ti.com>
Date: Tue, 31 Jul 2018 15:34:33 +0530
MIME-Version: 1.0
In-Reply-To: <CAMRc=MdwCruRZ_EQ3Pzq-=HdhiA6pfSZczRKMa5i9Rju0JgHig@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Bjorn,

On Tuesday 31 July 2018 01:25 PM, Bartosz Golaszewski wrote:
> 2018-07-31 6:25 GMT+02:00 Bjorn Andersson <bjorn.andersson@linaro.org>:
>> On Thu 21 Jun 00:37 PDT 2018, Bartosz Golaszewski wrote:
>>
>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>
>>> Switch to using the reset framework instead of handcoded reset routines
>>> we used so far.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>> Reviewed-by: Sekhar Nori <nsekhar@ti.com>
>>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
> 
> Sekhar,
> 
> can you take this through your tree or is it already too late?

The last -rc is already tagged and I am not sure ARM-SoC will be open to
new stuff now (there is also a bit of lag after I send my pull request).

Is this something you can take in your tree along with Suman's patch?

There are no build dependencies with my tree, so it will be safe to
queue from your tree. It will be great if this can be merged late in the
cycle though to avoid breaking remoteproc even for short while during
the merge window.

Or if you okay with it, it will be safest to send it soon after
v4.19-rc1 is tagged.

Let me know.

Thanks,
Sekhar
