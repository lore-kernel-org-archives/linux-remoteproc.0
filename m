Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH] remoteproc/ste: Delete unused driver
References: <20161205141021.2d9ada51@endymion>
 <CACRpkdac2iFXt+Ffd315SzWrzpz5z4bX9c6_pufs52-5i7wj4Q@mail.gmail.com>
 <02ceca2a-0247-460b-a6e6-a0bac358829d@ti.com>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <2dd09aec-2742-a406-0608-a626c6b47ddb@st.com>
Date: Wed, 7 Dec 2016 21:40:47 +0100
MIME-Version: 1.0
In-Reply-To: <02ceca2a-0247-460b-a6e6-a0bac358829d@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.de>, Lee Jones <lee.jones@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Tarnyagin <dt@jetro.no>
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/07/2016 06:14 PM, Suman Anna wrote:
> On 12/07/2016 04:49 AM, Linus Walleij wrote:
>> On Mon, Dec 5, 2016 at 2:10 PM, Jean Delvare <jdelvare@suse.de> wrote:
>>
>>> Back in July 2014 I asked around what was the intended target
>>> platform for the STE Modem remoteproc driver, so that I could add the
>>> proper hardware dependency to its config option. The answer I got was
>>> that there was no known publicly available hardware needing it and it
>>> was unlikely that there ever would.
>>>
>>> So I think it's time to delete this driver to lower the maintenance
>>> burden.
>>>
>>> Signed-off-by: Jean Delvare <jdelvare@suse.de>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Ohad Ben-Cohen <ohad@wizery.com>
>>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Cc: Suman Anna <s-anna@ti.com>
>>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> I put Dmitry in CC, last chance to protest :)
>
> + Lee and Loic as well, would be nice to get an Ack from either one of them.

I confirm, no public hardware available.
Thanks for the clean up.

Acked-by: Loic Pallardy <loic.pallardy@st.com>


regards,
Loic
>
> regards
> Suman
>
