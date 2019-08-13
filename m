Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190813130946.16448-1-govinds@codeaurora.org>
References: <20190813130946.16448-1-govinds@codeaurora.org>
Subject: Re: [v2 0/2] Add Q6SSTOP clock controller for QCS404
From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 13 Aug 2019 11:32:20 -0700
Message-Id: <20190813183220.DFF1A20665@mail.kernel.org>
Cc: bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, andy.gross@linaro.org, linux-remoteproc@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2019-08-13 06:09:44)
> Add support for the Q6SSTOP clock control used on qcs404
> based devices. This would allow wcss remoteproc driver to
> control the required WCSS Q6SSTOP clock/reset controls to
> bring the subsystem out of reset and shutdown the WCSS Q6DSP.

What changed from v1? Please include a changelog so we know what
happened.
