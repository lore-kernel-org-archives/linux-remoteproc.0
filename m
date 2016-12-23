Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 22 Dec 2016 16:15:04 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 4/7] remoteproc: qcom: Modify regulator enable and
 disable interface.
Message-ID: <20161223001504.GC10519@minitux>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
 <1481804490-8583-5-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481804490-8583-5-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 15 Dec 04:21 PST 2016, Avaneesh Kumar Dwivedi wrote:

> Regulator enable/disable routine will get additional input parameter
> of regulator info and count, It will read regulator info and will do
> appropriate voltage and load configuration before turning them up/down.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>

Looks good, please squash into patch 3.

Regards,
Bjorn
