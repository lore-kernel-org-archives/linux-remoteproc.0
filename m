Return-Path: <tsoni@codeaurora.org>
Subject: Re: [PATCH] samples/rpmsg: Introduce a module parameter for message
 count
References: <20180911174643.26199-1-s-anna@ti.com>
From: Trilok Soni <tsoni@codeaurora.org>
Message-ID: <2d904881-ec72-dd68-48ff-b8307642bc63@codeaurora.org>
Date: Tue, 11 Sep 2018 11:17:40 -0700
MIME-Version: 1.0
In-Reply-To: <20180911174643.26199-1-s-anna@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

Bjorn,

>   
>   #define MSG		"hello world!"
> -#define MSG_LIMIT	100
> +
> +static int count = 100;
> +module_param(count, int, 0644);

I thought Greg KH doesn't want any new code to have module_param call, 
right? Are we Ok here or I am missing something here.

-- 
---Trilok Soni
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
