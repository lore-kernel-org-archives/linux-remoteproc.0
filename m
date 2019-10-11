Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 0/2] Add Q6SSTOP clock controller for QCS404
Date: Fri, 11 Oct 2019 18:59:26 +0530
Message-Id: <20191011132928.9388-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh@kernel.org, sboyd@kernel.org
Cc: bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for the Q6SSTOP clock control used on qcs404
based devices. This would allow wcss remoteproc driver to
control the required WCSS Q6SSTOP clock/reset controls to
bring the subsystem out of reset and shutdown the WCSS Q6DSP.

Changes in v4:
    - changed binding doc license to (GPL-2.0-only OR BSD-2-Clause).

Changes in v3:
    - Fixed dt binding errors.

Changes in v2:
    - changed binding doc to yaml format.
    - Fixed alignment in q6sstop cc driver.

Govind Singh (2):
  dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
  clk: qcom: Add Q6SSTOP clock controller for QCS404

 .../bindings/clock/qcom,q6sstopcc.yaml        |  43 ++++
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/q6sstop-qcs404.c             | 223 ++++++++++++++++++
 .../dt-bindings/clock/qcom,q6sstopcc-qcs404.h |  18 ++
 5 files changed, 293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
 create mode 100644 drivers/clk/qcom/q6sstop-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h

-- 
2.22.0
