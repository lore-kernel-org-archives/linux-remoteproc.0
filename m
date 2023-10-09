Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA51CD612F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Oct 2023 20:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377876AbjJIUsb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Oct 2023 16:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377082AbjJIUsa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Oct 2023 16:48:30 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9565292
        for <linux-remoteproc@vger.kernel.org>; Mon,  9 Oct 2023 13:48:29 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpxAx-0002zo-1x; Mon, 09 Oct 2023 22:48:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpxAw-000V0c-Bz; Mon, 09 Oct 2023 22:48:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpxAw-00CaKd-2c; Mon, 09 Oct 2023 22:48:26 +0200
Date:   Mon, 9 Oct 2023 22:48:25 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: remove callback of ti_k3_dsp remoteproc driver
Message-ID: <20231009204825.6n2t366oad7gke2l@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kzqzvhcic3cibqod"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


--kzqzvhcic3cibqod
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

k3_dsp_rproc_remove() in drivers/remoteproc/ti_k3_dsp_remoteproc.c looks
as follows:

static int k3_dsp_rproc_remove(struct platform_device *pdev)
{
        struct k3_dsp_rproc *kproc =3D platform_get_drvdata(pdev);
        struct rproc *rproc =3D kproc->rproc;
        struct device *dev =3D &pdev->dev;
        int ret;

        if (rproc->state =3D=3D RPROC_ATTACHED) {
                ret =3D rproc_detach(rproc);
                if (ret) {
                        dev_err(dev, "failed to detach proc, ret =3D %d\n",=
 ret);
                        return ret;
                }
        }

        rproc_del(kproc->rproc);

        ret =3D ti_sci_proc_release(kproc->tsp);
        if (ret)
                dev_err(dev, "failed to release proc, ret =3D %d\n", ret);

        kfree(kproc->tsp);

        ret =3D ti_sci_put_handle(kproc->ti_sci);
        if (ret)
                dev_err(dev, "failed to put ti_sci handle, ret =3D %d\n", r=
et);

        k3_dsp_reserved_mem_exit(kproc);
        rproc_free(kproc->rproc);

        return 0;
}

The error return in the first if block is dangerous: If rproc_detach()
fails, rproc_del() is skipped and so the rproc structure is kept in
rproc_list, with the pointers in rproc->ops leading into nirvana if the
ti_k3_dsp_remoteproc module is unloaded.

I don't know enough about rproc to directly see the right fix for that
issue. Maybe it's just to drop "return ret;", but I guess that's not
safe either?! As I don't have a suggestion to fix this, there is no
patch included here in this bug report :-\

Another minor issue here is: return 0 instead of return ret in the error
path would be an improvement. Returning a non-zero value in a remove
callback is useless. The only effect is that the core will emit

	dev_warn(_dev, "remove callback returned a non-zero value. This will be ig=
nored.\n");

(see platform_remove()) and then it will continue to remove the device.

I want to change the prototype of remove callbacks to

	void (*)(struct platform_device *)

to prevent this type of bug. To progress here I'd like to propose:

--->8---
Convert to platform remove callback returning void

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code.  However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

The non-zero return value of the first exit point of
k3_dsp_rproc_remove() is ignored by the core, so the only semantical
change here is that an additional warning by the core is suppressed if
rproc_detach() fails. This is even an improvement because
k3_dsp_rproc_remove() already emitted a more useful message.

Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc=
/ti_k3_dsp_remoteproc.c
index ef8415a7cd54..8207439e4927 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -825,7 +825,7 @@ static int k3_dsp_rproc_probe(struct platform_device *p=
dev)
 	return ret;
 }
=20
-static int k3_dsp_rproc_remove(struct platform_device *pdev)
+static void k3_dsp_rproc_remove(struct platform_device *pdev)
 {
 	struct k3_dsp_rproc *kproc =3D platform_get_drvdata(pdev);
 	struct rproc *rproc =3D kproc->rproc;
@@ -836,7 +836,7 @@ static int k3_dsp_rproc_remove(struct platform_device *=
pdev)
 		ret =3D rproc_detach(rproc);
 		if (ret) {
 			dev_err(dev, "failed to detach proc, ret =3D %d\n", ret);
-			return ret;
+			return;
 		}
 	}
=20
@@ -854,8 +854,6 @@ static int k3_dsp_rproc_remove(struct platform_device *=
pdev)
=20
 	k3_dsp_reserved_mem_exit(kproc);
 	rproc_free(kproc->rproc);
-
-	return 0;
 }
=20
 static const struct k3_dsp_mem_data c66_mems[] =3D {
--->8---

But if you want to address the graver bug first, I can wait to prevent
patch conflicts.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kzqzvhcic3cibqod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUkZxkACgkQj4D7WH0S
/k7F7ggAuOjAM86t4m//lgQtXK5BXN7rfZLkKIvxZaSuUF6yWh1SHpTlzxJC5iOt
MHqb3GUjWW5JVlIEjwfVwhDBB3iC47kbM7Vgk/KSSTCH49nXyD05CwgQ4Uf+bQES
uGZtAJI+LCf6I1vbo4L47PS4ommJWoJQAZPlxjKxcUmlea9NNurJUK+RgD9RofeF
VONbQKsUR5Y+xlVAg90nMxuMJzO86EGIEdFrpYLHTIBNzXfJQe3hp2Rba6TSOxj1
pF74UicuWNcMc0oWSV71U9DHER+gxvyiFEYmhlwQkRf5I5hYTrVX896Ze0I+rRQm
hEpJDICLTP1nrUrjMqcDGykClYzesQ==
=Zc38
-----END PGP SIGNATURE-----

--kzqzvhcic3cibqod--
