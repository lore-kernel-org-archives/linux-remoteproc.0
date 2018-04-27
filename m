Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 12:05:39 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: soc: qcom: Add label for GLINK
 bindings
Message-ID: <20180427170539.657wlerutkudfy2m@rob-hp-laptop>
References: <1524783545-21951-1-git-send-email-clew@codeaurora.org>
 <1524783545-21951-2-git-send-email-clew@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524783545-21951-2-git-send-email-clew@codeaurora.org>
To: Chris Lew <clew@codeaurora.org>
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, mark.rutland@arm.com, aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Apr 26, 2018 at 03:59:00PM -0700, Chris Lew wrote:
> There are GLINK clients who open the same channel on multiple GLINK
> links. These clients need a way to distinguish which remoteproc they
> are communicating to. Add a label property to identify the edge this
> node represents.

Isn't there a better way? "label" is really intended for things that 
would be printed on a sticker to be read by a human.

Rob
