Return-Path: <jmcnicol@redhat.com>
Date: Fri, 26 Jan 2018 17:35:34 -0800
From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [PATCH 0/5] Qualcomm SMD updates
Message-ID: <20180127013534.GA734@mini-rhel.redhat.com>
References: <20171212235857.10432-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171212235857.10432-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Will Newton <will.newton@gmail.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chris Lew <clew@quicinc.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Dec 12, 2017 at 03:58:52PM -0800, Bjorn Andersson wrote:
> A series of fixes for a few issues reported or seen with SMD.
> 
> The first two fixes changes the trigger for creating devices for channels
> found, which should cause the rpm-smd driver to probe on 8909 and 8994 devices.
> 

.... and 8992.

> The third patch fixes an issue when multiple callers end up waiting on events.
> 
> The forth fix moves the check for a closed channel out of the tx-full loop, to
> fail non-full send requests on a closed channel as well.
> 
> The last fix improves the handling of concurrent send-requests, allowing
> concurrent sends, in particular try_send, to progress even though we're
> sleeping waiting for room in the tx fifo.
> 
> Bjorn Andersson (5):
>   rpmsg: smd: Perform handshake during open
>   rpmsg: smd: Create device for all channels
>   rpmsg: smd: Wake up all waiters
>   rpmsg: smd: Fail send on a closed channel
>   rpmsg: smd: Don't hold the tx lock during wait
> 
>  drivers/rpmsg/qcom_smd.c | 60 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 47 insertions(+), 13 deletions(-)
>


Please add my tested by on this series as I have verified them on both
my Nexus 5X and 6P.  

-jeremy
