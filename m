Return-Path: <gustavo@embeddedor.com>
Subject: Re: [PATCH] rpmsg: glink: Use struct_size() helper
References: <20190829181721.GA22554@embeddedor>
 <20190829190955.GP6167@minitux>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <09987035-9768-f6dd-c668-5b04caf61e31@embeddedor.com>
Date: Thu, 29 Aug 2019 14:15:42 -0500
MIME-Version: 1.0
In-Reply-To: <20190829190955.GP6167@minitux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 8/29/19 2:09 PM, Bjorn Andersson wrote:
> On Thu 29 Aug 11:17 PDT 2019, Gustavo A. R. Silva wrote:
> 
>> One of the more common cases of allocation size calculations is finding
>> the size of a structure that has a zero-sized array at the end, along
>> with memory for some number of elements for that array. For example:
>>
>> struct {
>> 	...
>> 	struct intent_pair intents[];
>> } __packed * msg;
>>
>> Make use of the struct_size() helper instead of an open-coded version
>> in order to avoid any potential type mistakes.
>>
>> So, replace the following form:
>>
>> sizeof(*msg) + sizeof(struct intent_pair) * count
>>
>> with:
>>
>> struct_size(msg, intents, count)
>>
>> This code was detected with the help of Coccinelle.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> 
> Applied, thanks!
> 

Awesome. :)

Thanks!
--
Gustavo
