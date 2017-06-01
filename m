Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 1 Jun 2017 13:30:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 1/4] firmware: scm: Add new SCM call API for switching
 memory ownership
Message-ID: <20170601203052.GY12920@tuxbook>
References: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
 <1496344641-6291-2-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496344641-6291-2-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 01 Jun 12:17 PDT 2017, Avaneesh Kumar Dwivedi wrote:

> Two different processors on a SOC need to switch memory ownership
> during load/unload. To enable this, level second memory map table
> need to be updated, which is done by secure layer.
> This patch add the interface for making secure monitor call for
> memory ownership switching request.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
