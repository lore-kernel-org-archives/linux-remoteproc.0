Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5734AC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Feb 2022 22:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238948AbiBYXAN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Feb 2022 18:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiBYXAN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Feb 2022 18:00:13 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75981AAFC5;
        Fri, 25 Feb 2022 14:59:40 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id 8E83F1F467FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1645829979;
        bh=5/cbXG/0jty+bdChTJn7AE0JyJhsUQJkq1UGkqKxjAw=;
        h=From:To:Cc:Subject:Date:From;
        b=T4wnPFhH210ovR8105MIZoT/yV/bB+jd6nxy9AE3kGprtoXa1BSuJ6MCxRFsJmT5g
         JhWsJmv3/8R82KXFXFPiQhqF23/YufhERkmCfRDECgySYyrQrXlorM3mrWEPfOIF/a
         QUDNwhK/lTIOHx4gpqzVal3uO4ZZ2t0j3oUA1hL2sp8L/Ovc3L5Hq4v4CMVMpFlQgm
         cwrQBnjE+hsjvmq/zTmgyJ2LncrM0M3Vls5BrSmTuYRXDgNepxPfQwmcw/3mjH2lz3
         4xsS0NGfysoh1gszQpTAb60P+BgHmffTyGp2lh1YHsOxRLyiZzZlZggN8764nQgYyq
         upAxn/I9+RAMQ==
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v1 0/3] Fixes for Mediatek dt-bindings
Date:   Fri, 25 Feb 2022 17:58:51 -0500
Message-Id: <20220225225854.81038-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


This series has some fixes for Mediatek dt-bindings. It solves some
warnings printed by dtbs_check, both for already merged Devicetrees, as
well as some that would be introduced by the changes to mt8192.dtsi in
[1].

[1] https://lore.kernel.org/all/20220218091633.9368-1-allen-kh.cheng@mediatek.com/


Nícolas F. R. A. Prado (3):
  dt-bindings: remoteproc: mediatek: Add interrupts property to mtk,scp
  dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be
    optional
  media: dt-bindings: mtk-vcodec-encoder: Add power-domains property

 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml     | 3 +++
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 3 +++
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml   | 1 +
 3 files changed, 7 insertions(+)

-- 
2.35.1

