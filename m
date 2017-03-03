Return-Path: <sboyd@codeaurora.org>
Date: Fri, 3 Mar 2017 10:21:13 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/3] remoteproc: qcom: Add scm call to protect modem
 mem in mss rproc drv.
Message-ID: <20170303182113.GT25384@codeaurora.org>
References: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
 <1485773044-31489-3-git-send-email-akdwived@codeaurora.org>
 <20170228071632.GG25384@codeaurora.org>
 <eae8acc4-caa5-51b8-092d-78a37ebb9338@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eae8acc4-caa5-51b8-092d-78a37ebb9338@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 03/03, Dwivedi, Avaneesh Kumar (avani) wrote:
> On 2/28/2017 12:46 PM, Stephen Boyd wrote:
> >On 01/30, Avaneesh Kumar Dwivedi wrote:
> >>+		dest_info[i].vm = dest[i];
> >>+		dest_info[i].perm = perm[i];
> >Needs to do a cpu_to_le32() somewhere. Please run sparse.
> I understand that byte reordering needed but not sure what is sparse
> will check and do it.

http://git.kernel.org/cgit/devel/sparse/sparse.git/

> >
> >>+		dest_info[i].ctx = NULL;
> >>+		dest_info[i].ctx_size = 0;
> >>+	}
> >Perhaps we should just allocate these first (one or two elements
> >isn't a big difference) and then fill the details in directly.
> Not very clear what is ask here?
> >

I'm saying we could fill in dest_info in the case statement
instead of here in an up to 2 times loop.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
