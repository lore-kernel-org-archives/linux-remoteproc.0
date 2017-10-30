Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Mon, 30 Oct 2017 18:04:24 -0500
From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v8 1/4] firmware: scm: Add new SCM call API for switching
 memory ownership
Message-ID: <20171030230424.GA24757@hector.attlocal.net>
References: <1508860347-25181-1-git-send-email-akdwived@codeaurora.org>
 <1508860347-25181-2-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508860347-25181-2-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: bjorn.andersson@linaro.org, sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Oct 24, 2017 at 09:22:24PM +0530, Avaneesh Kumar Dwivedi wrote:
> Two different processors on a SOC need to switch memory ownership
> during load/unload. To enable this, second level memory map table
> need to be updated, which is done by secure layer.
> This patch adds the interface for making secure monitor call for
> memory ownership switching request.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>

Looks fine to me.

Acked-by: Andy Gross <andy.gross@linaro.org>
