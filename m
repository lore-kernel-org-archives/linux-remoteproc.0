Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] samples/rpmsg: Introduce a module parameter for message
 count
References: <20180911174643.26199-1-s-anna@ti.com>
 <2d904881-ec72-dd68-48ff-b8307642bc63@codeaurora.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <2134784b-8645-cbf3-41af-7c9cc800a146@ti.com>
Date: Mon, 1 Oct 2018 16:09:18 -0500
MIME-Version: 1.0
In-Reply-To: <2d904881-ec72-dd68-48ff-b8307642bc63@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Trilok Soni <tsoni@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Trilok,

On 09/11/2018 01:17 PM, Trilok Soni wrote:
> Bjorn,
> 
>>     #define MSG        "hello world!"
>> -#define MSG_LIMIT    100
>> +
>> +static int count = 100;
>> +module_param(count, int, 0644);
> 
> I thought Greg KH doesn't want any new code to have module_param call,
> right? Are we Ok here or I am missing something here.

Can you point me to the thread where this was discussed/decided?

regards
Suman
