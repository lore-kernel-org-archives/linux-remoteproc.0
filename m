Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:35548 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbeLRAC4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Dec 2018 19:02:56 -0500
Received: by mail-vs1-f65.google.com with SMTP id e7so8912438vsc.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Dec 2018 16:02:55 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id t10sm3985441ual.13.2018.12.17.16.02.55
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 16:02:55 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 197so3285033vkf.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Dec 2018 16:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20181217100724.4593-1-sibis@codeaurora.org> <20181217100724.4593-7-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-7-sibis@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Dec 2018 16:02:43 -0800
Message-ID: <CAD=FV=WYda6Th_bjoYsnkzUjcYj7uGb0=3Be-EVu4VHvzxNymQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sdm845: Add shutdown-ack for
 Q6V5 MSS node
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: sibis@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Mon, Dec 17, 2018 at 2:08 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add shutdown-ack smp2p interrupt for Q6V5 MSS node.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> This patch depends on:
> https://patchwork.kernel.org/patch/10691213/ - shutdown-ack dt bindings
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
