Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 12 Sep 2016 14:53:02 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 00/17] Make rpmsg a framework
Message-ID: <20160912215302.GK405@tuxbot>
References: <1472768889-3906-1-git-send-email-bjorn.andersson@linaro.org>
 <20160912165233.GB21885@linaro.org>
 <20160912180015.GH405@tuxbot>
 <bc618ac9-13c8-e9bf-c7e9-fe5b7309a585@codeaurora.org>
 <20160912184957.GI405@tuxbot>
 <7682a26a-310b-b283-dfe8-56d114f92dcb@codeaurora.org>
 <20160912195854.GJ405@tuxbot>
 <57D71FD9.9070007@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57D71FD9.9070007@codeaurora.org>
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Lina Iyer <lina.iyer@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 12 Sep 14:36 PDT 2016, Karthikeyan Ramasubramanian wrote:

> On 9/12/2016 1:58 PM, Bjorn Andersson wrote:
[..]
> >I have not looked through all of APR yet and don't know where msm_bus is
> >heading, but for IPC-router your correct that the downstream driver does
> >indeed require this; but that's a side effect of the downstream
> >ipcrouter implementation, not the problem itself.
> >
> APR does send messages in atomic context in addition to the RPM Driver, but
> IPC Router does not to the extent of my knowledge.

Thanks for the information, Karthik.

There seem to be 196 calls to apr_send_pkt() in the msm-3.18 kernel, I
will have to go through them all later, but could you help me by
pointing me to one of those that actually need to be executed in atomic
context?

Thanks,
Bjorn
