Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 22 Dec 2016 16:17:06 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 5/7] remoteproc: qcom: Modify clock enable and disable
 interface.
Message-ID: <20161223001706.GD10519@minitux>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
 <1481804490-8583-6-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481804490-8583-6-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 15 Dec 04:21 PST 2016, Avaneesh Kumar Dwivedi wrote:

> Clock enable/disable routine will get additional input parameter of
> pointer of array of clock struct's and clock count, it will use these
> pre initialized values to turn them up/down.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>

Looks good, please squash into the clock-patch.

Regards,
Bjorn
