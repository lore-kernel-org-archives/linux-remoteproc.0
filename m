Return-Path: <sashal@kernel.org>
Date: Wed, 05 Feb 2020 14:45:10 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH v3 1/2] remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
In-Reply-To: <20200204062641.393949-2-bjorn.andersson@linaro.org>
References: <20200204062641.393949-2-bjorn.andersson@linaro.org>
Message-Id: <20200205144511.ADE722082E@mail.kernel.org>
To: Sasha Levin <sashal@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, stable@vger.kernel.orgstable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch").

The bot has tested the following trees: v5.5.1, v5.4.17, v4.19.101.

v5.5.1: Build OK!
v5.4.17: Build OK!
v4.19.101: Failed to apply! Possible dependencies:
    0304530ddd29 ("remoteproc: qcom: q6v5-mss: Refactor mba load/unload sequence")
    7dd8ade24dc2 ("remoteproc: qcom: q6v5-mss: Add custom dump function for modem")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
