Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35387C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 00:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbiESAFo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 May 2022 20:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbiESAF1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 May 2022 20:05:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F09AD80A6;
        Wed, 18 May 2022 17:05:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38ACA6177A;
        Thu, 19 May 2022 00:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAA0C385A5;
        Thu, 19 May 2022 00:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652918714;
        bh=k6jAiKZFDtgwweX5wl2BqyK+v6NKhDb2w9LlWR81qLs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aoHlqq6dMijyBAf3lcomjHcd3eB5Ig5tZSFw2ltmJTNLTNOaLkhJwPhlHAEQPTQoF
         Tqp4R7TkSxu7uypPAmYSTly0i+KK4pVT9m4YnWTF+aykBiS3eMCNc7Cmp266wC/x+3
         Uzse3Jp3vfeMaX9gJ+uQ0jx+K2NPinZ0wi1H/mJJpBX0Wet9ORTQPVrr5wH80uZiPL
         LJTouTNjK6/oer7C873ELiQsiiK2lsFOhEfWY6C0Cycw9DAb6jPj/NxZ9m4xXFcD9h
         mQVwMF4HOi8l3vO5meAGiHhUjbiBCxsL/NHLyDggrJRZe8KzOsh7WtCLyrcJ9ahTjy
         8FKq8gB1y5w8w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220501103520.111561-3-krzysztof.kozlowski@linaro.org>
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org> <20220501103520.111561-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/8] remoteproc: qcom: correct kerneldoc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Date:   Wed, 18 May 2022 17:05:12 -0700
User-Agent: alot/0.10
Message-Id: <20220519000514.8EAA0C385A5@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-05-01 03:35:15)
> Correct kerneldoc warnings like:
>=20
>   drivers/remoteproc/qcom_common.c:68:
>     warning: expecting prototype for struct minidump_subsystem_toc. Proto=
type was for struct minidump_subsystem instead
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
