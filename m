Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 1 Jun 2017 13:32:20 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 2/4] remoteproc: qcom: refactor mss fw image loading
 sequence
Message-ID: <20170601203220.GZ12920@tuxbook>
References: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
 <1496344641-6291-3-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496344641-6291-3-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 01 Jun 12:17 PDT 2017, Avaneesh Kumar Dwivedi wrote:

> This patch refactor code to first load all firmware blobs
> and then update modem proc to authenticate and boot fw.
> 

This looks good, but I have not had a chance to test this on older
platforms yet.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
