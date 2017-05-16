Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170512224840.GW15143@minitux>
References: <20170506011920.GH15143@minitux> <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
 <20170508055439.GJ15143@minitux> <CABb+yY3CfWFBDh-qoGHDeHyLhVC7mPQZFB=VDS54OaypG-BqPw@mail.gmail.com>
 <20170508191154.GM15143@minitux> <CABb+yY2uC6vNFTq1KtZwrrw8x4BEfc2cMjF5DwrLbGpYWBNBzQ@mail.gmail.com>
 <20170509191106.GQ15143@minitux> <CABb+yY2LoX_rOSCkhnp-gS7EHTN+98xNn2E1+z7_7bFjQ2wtoA@mail.gmail.com>
 <20170510190046.GT15143@minitux> <CABb+yY2Upw_RALXjL_=yAUCOMzpb+PV6v_OjiznKBUJnFE2UVQ@mail.gmail.com>
 <20170512224840.GW15143@minitux>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 16 May 2017 16:55:09 +0530
Message-ID: <CABb+yY3s6DeWJ8v++v3wOF-tNpcZnRqzpC-bH=6hZzutyEyWTA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat, May 13, 2017 at 4:18 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 10 May 19:07 PDT 2017, Jassi Brar wrote:
>
>> On Thu, May 11, 2017 at 12:30 AM, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>> > On Tue 09 May 19:33 PDT 2017, Jassi Brar wrote:
> [..]
>> > So please let me know what you think about [1], if you don't like it
>> > I'll fix the things pointed to by Stephen and we'll have to live with
>> > the two calls.
>> >
>> My last reply was about [1]. Other platforms call
>> mbox_send_data()+mbox_client_txdone() see
>> drivers/firmware/tegra/bpmp.c, but you want to introduce another API
>> in the innards of the framework.
>
> Okay, lets go with that then. I will incorporate the changes requested
> by Stephen and post a final version and then add the
> mbox_client_txdone() in the clients.
>
OK cool. And please update the commit log discarding
"The driver implements the "doorbell" binding and could be used as basis
for a new Linux framework, if found useful outside Qualcomm."

Cheers!
