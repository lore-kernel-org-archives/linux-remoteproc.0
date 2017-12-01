Date: Thu, 30 Nov 2017 21:31:41 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 4/5] remoteproc: qcom: Introduce sysmon
Message-ID: <20171201053141.GY28761@minitux>
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-5-bjorn.andersson@linaro.org>
 <2a4cb3e2-16ea-49f4-e40d-ee1f2a56929b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a4cb3e2-16ea-49f4-e40d-ee1f2a56929b@codeaurora.org>
To: Chris Lew <clew@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 17:52 PST 2017, Chris Lew wrote:

> 
> 
> On 11/29/2017 5:16 PM, Bjorn Andersson wrote:
> > The sysmon client communicates either via a dedicated SMD/GLINK channel
> > or via QMI encoded messages over IPCROUTER with remote processors in
> > order to perform graceful shutdown and inform about other remote
> > processors shutting down.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> Acked-By: Chris Lew <clew@codeaurora.org>
> 

Thanks

> Looked into who is listening to the other notifications besides
> BEFORE_SHUTDOWN and I think subsequent patches will need to add support for
> at least AFTER_POWERUP.
> 

Agreed.

Regards,
Bjorn
