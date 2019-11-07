Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191011132928.9388-3-govinds@codeaurora.org>
References: <20191011132928.9388-1-govinds@codeaurora.org> <20191011132928.9388-3-govinds@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 2/2] clk: qcom: Add Q6SSTOP clock controller for QCS404
Date: Thu, 07 Nov 2019 11:32:32 -0800
Message-Id: <20191107193233.5C6832087E@mail.kernel.org>
To: Govind Singh <govinds@codeaurora.org>, robh@kernel.org
Cc: bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2019-10-11 06:29:28)
> Add support for the Q6SSTOP clock control used on qcs404
> based devices. This would allow wcss remoteproc driver to
> control the required WCSS Q6SSTOP clock/reset controls to
> bring the subsystem out of reset and shutdown the WCSS Q6DSP.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---

Applied to clk-next
