Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726092332.25202-2-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <20190726092332.25202-2-govinds@codeaurora.org>
Subject: Re: [PATCH v5 1/7] clk: qcom: Add WCSS gcc clock control for QCS404
From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 08 Aug 2019 08:10:14 -0700
Message-Id: <20190808151015.A4C0121874@mail.kernel.org>
To: bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2019-07-26 02:23:26)
> Add support for the WCSS QDSP gcc clock control used on qcs404
> based devices. This would allow wcss remoteproc driver to control
> the required gcc clocks to bring the subsystem out of reset.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---

Applied to clk-next
