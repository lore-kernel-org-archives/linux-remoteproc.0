Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 16 Oct 2017 11:58:04 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v7 4/4] remoteproc: qcom: Add support for mss remoteproc
 on msm8996
Message-ID: <20171016185804.GK1165@minitux>
References: <1500634173-24416-1-git-send-email-akdwived@codeaurora.org>
 <1500634173-24416-5-git-send-email-akdwived@codeaurora.org>
 <20171012182052.GG1165@minitux>
 <a92e3adc-bcd9-fbe2-7a32-ae1752845740@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a92e3adc-bcd9-fbe2-7a32-ae1752845740@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 16 Oct 06:19 PDT 2017, Dwivedi, Avaneesh Kumar (avani) wrote:
> On 10/12/2017 11:50 PM, Bjorn Andersson wrote:
[..]
> > Please fix this and add my Acked-by
> Sure will do, just want to ask, when i am sending updated patches, should i
> sent all the 4 patches in series or should skip those which are acked by
> you.

Please include all the patches in each submission (unless the maintainer
tells you that he/she applied some of them already).

Make sure to add any "Acked-by", "Reviewed-by" and "Tested-by" on your
patches, so that people know that they are already reviewed/tested.


And finally, when resending patches, add a section between "---" and the
diff-stat describing changes since the last version - that makes it
easier to see what changed since last time and will help the reviewer
look at the "new" things.

Thanks,
Bjorn
