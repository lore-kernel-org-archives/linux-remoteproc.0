Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 29 Dec 2016 11:55:06 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 7/7] clk: qcom: Add GCC_MSS_RESET support
Message-ID: <20161229195506.GD10531@minitux>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
 <1481804490-8583-8-git-send-email-akdwived@codeaurora.org>
 <20161228234016.GG17126@codeaurora.org>
 <20161229170901.GA17770@hector.attlocal.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161229170901.GA17770@hector.attlocal.net>
To: Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 29 Dec 09:09 PST 2016, Andy Gross wrote:

> On Wed, Dec 28, 2016 at 03:40:16PM -0800, Stephen Boyd wrote:
> > On 12/15, Avaneesh Kumar Dwivedi wrote:
> > > Add support to use reset control framework for resetting MSS
> > > with hexagon v56 1.5.0.
> > > 
> > > Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > 
> > Applied to clk-next. I take it the dts part won't be landing in
> > v4.11 so no need to make a special branch for this new define.
> 
> I'd prefer to avoid this by using the hard coded values instead of #defines
> until the pieces are in place.  So any DT changes sent during that time period
> will not be accepted if they use the #define, or I will munge them myself.
> 

In testing of the Hexagon PIL on "real" hardware we ran into PBL error
-284098560, so we will need to get the SCM calls for assigning memory
permissions (SCM_SVC_MP/MEM_PROT_ASSIGN_ID) to move forward with the
8996 PIL.

In addition to this we also need a few more gcc clocks and working rpmcc
on 8996 (i.e. GLINK).


So we don't have to worry about this define in v4.11.

Thanks for picking up the patch Stephen.

Regards,
Bjorn
