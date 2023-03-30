Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98699C77B6F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Mar 2023 16:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbjC3QrV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Mar 2023 12:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbjC3Qqs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Mar 2023 12:46:48 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2686BD301;
        Thu, 30 Mar 2023 09:46:47 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4PnTpW25vZz9sbr;
        Thu, 30 Mar 2023 18:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1680194803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CDic2DWXEveWIFjjsI0wf1iLoXWFLpfYPEazDmKGMLk=;
        b=U7hbb4uncwtp1OMCbUfcHEkTGSkv6T8s7nj/ipu0KT8SLj8yfIzl40zGJb3Fwy7y/zWtnS
        OrB4Qq9aEQqm//AaVviS7CXOKORwy63aQ9f3Lgl/+/B+tR4VpD6oA6dzu5XM4mczPH+0WT
        mRnMAjoxlWNO2c1nqe+sFOgQF7wTZSqk7iLlFRZsb3ogGLEwbJ+StPFyCAT/XneLXX4QXi
        aPPOwVffnXyFfmhIuT9csbiM1+JJYyNUNq6vtabaLqsZARyzCNDks8enBV3PmWzLb40q9S
        v+72EBvpkTWiqo0iVaQOhryDQDpaOg3MCL8y+4dpj6B6smtHPp7Mi5NcOUz8Fw==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v3 0/3] remoteproc: qcom: pas: Support SDM845 SLPI
Date:   Thu, 30 Mar 2023 18:46:30 +0200
Message-Id: <20230330164633.117335-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4PnTpW25vZz9sbr
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

* About *

The Qualcomm SDM845 SoC has a separate SLPI (Sensor Low Power Island)
DSP for sensors connected to the SoC which is responsible for exposing
sensors to userspace, power saving, and other features. 
While sensors are connected to GPIOs of the SoC, they cannot be used
because the hypervisor blocks direct access to the sensors, thus the 
DSP must be used to access any sensor on this SoC. The SLPI DSP uses a
GLink edge (dsps) to communicate with the host and has a FastRPC interface
to load files from the host filesystem such as sensor configuration files.
The FastRPC interface does not use regular FastRPC Compute Banks
but instead uses an allocated CMA region through which communication happens.

* Changes *

This patchseries adds support for this remoteproc in the q6v5_pas driver
to allow booting the SLPI on the SDM845 and expose its service 400 over QRTR.

* Related patches *

Support for the FastRPC side of the SLPI and DTS changes are submitted
in separate series. These are the links to v2 of the series:

1. FastRPC changes:
https://lore.kernel.org/linux-arm-msm/20230327184204.498032-1-me@dylanvanassche.be/
2. DTS changes:
https://lore.kernel.org/linux-devicetree/20230327184811.499553-1-me@dylanvanassche.be

* Changelog *

Changes in v2:

- Removed double blank lines
- Added power-domain if:then: for SDM845 SLPI
- After adding SDM845 SLPI, refactor SLPI resource init

Changes in v3:

- First refactor SLPI resources of SM8150/SM8250/SM8350/SM8450/MSM8996/MSM8998,
  then add support for SDM845 SLPI.
- Add Reviewed-by for patch
  'dt-bindings: remoteproc: qcom: adsp: add qcom,sdm845-slpi-pas compatible'
  since it was not changed in v3.

Kind regards,
Dylan Van Assche

Dylan Van Assche (3):
  dt-bindings: remoteproc: qcom: adsp: add qcom,sdm845-slpi-pas
    compatible
  remoteproc: qcom: pas: refactor SLPI remoteproc init
  remoteproc: qcom: pas: add SDM845 SLPI compatible

 .../bindings/remoteproc/qcom,adsp.yaml        | 19 +++++++
 drivers/remoteproc/qcom_q6v5_pas.c            | 49 ++++---------------
 2 files changed, 28 insertions(+), 40 deletions(-)

-- 
2.39.2

