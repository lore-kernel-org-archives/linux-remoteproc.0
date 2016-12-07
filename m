Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] remoteproc/ste: Delete unused driver
References: <20161205141021.2d9ada51@endymion>
 <CACRpkdac2iFXt+Ffd315SzWrzpz5z4bX9c6_pufs52-5i7wj4Q@mail.gmail.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <02ceca2a-0247-460b-a6e6-a0bac358829d@ti.com>
Date: Wed, 7 Dec 2016 11:14:55 -0600
MIME-Version: 1.0
In-Reply-To: <CACRpkdac2iFXt+Ffd315SzWrzpz5z4bX9c6_pufs52-5i7wj4Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.de>, Lee Jones <lee.jones@linaro.org>, "loic.pallardy@st.com" <loic.pallardy@st.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Tarnyagin <dt@jetro.no>
List-ID: <linux-remoteproc@vger.kernel.org>

On 12/07/2016 04:49 AM, Linus Walleij wrote:
> On Mon, Dec 5, 2016 at 2:10 PM, Jean Delvare <jdelvare@suse.de> wrote:
> 
>> Back in July 2014 I asked around what was the intended target
>> platform for the STE Modem remoteproc driver, so that I could add the
>> proper hardware dependency to its config option. The answer I got was
>> that there was no known publicly available hardware needing it and it
>> was unlikely that there ever would.
>>
>> So I think it's time to delete this driver to lower the maintenance
>> burden.
>>
>> Signed-off-by: Jean Delvare <jdelvare@suse.de>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Ohad Ben-Cohen <ohad@wizery.com>
>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Cc: Suman Anna <s-anna@ti.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I put Dmitry in CC, last chance to protest :)

+ Lee and Loic as well, would be nice to get an Ack from either one of them.

regards
Suman
