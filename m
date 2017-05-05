Return-Path: <jhugo@codeaurora.org>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-3-bjorn.andersson@linaro.org>
 <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux>
 <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org>
 <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <ff1b18c2-d42e-a6e3-f725-019977960e89@codeaurora.org>
Date: Fri, 5 May 2017 14:39:38 -0600
MIME-Version: 1.0
In-Reply-To: <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 5/5/2017 2:22 PM, Jassi Brar wrote:
> On Sat, May 6, 2017 at 1:23 AM, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>> On 5/5/2017 1:22 PM, Jassi Brar wrote:
>>>
>>> On Sat, May 6, 2017 at 12:07 AM, Bjorn Andersson
>>> <bjorn.andersson@linaro.org> wrote:
>>>>
>>
>> There is no way to determine if the remote processor has observed a message,
>> that does not involve pretty trivial race conditions.
>>
> Thanks for chiming in.
> How is it supposed to work if a client queues more than one request?
> How do you know when it's ok to overwrite the FIFO and send the next
> command?
>    Usually if h/w doesn't indicate, we cook up some ack packet for each
> command. Otherwise the protocol seems badly broken.
> 
>   If there is really nothing that can be done to check delivery of a
> message, I'll pick the driver as such. Best of luck :)

The protocol is designed so that we don't need an ack, or confirmation 
of delivery.  Such details are left to the higher level protocol, if 
needed.

The transmitter owns the "head" pointer in the fifo, and the receiver 
owns the "tail" pointer.  The fifo is empty if those pointers are the 
same value.  When the receiver has copied data out of the fifo, it 
advances the tail pointer.  The transmitter must ensure that the head 
pointer never meets the tail pointer through wrap around.

You can kind of check delivery based on the position of the tail 
pointer, but I can tell you from experience, you never really want to do 
that as it never tells you what you really want to know.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
