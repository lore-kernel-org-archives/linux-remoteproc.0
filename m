Return-Path: <pavel@ucw.cz>
Date: Mon, 19 Dec 2016 10:22:50 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] remoteproc: add some kind of help
Message-ID: <20161219092250.GA13640@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
To: ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>
List-ID: <linux-remoteproc@vger.kernel.org>


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Top level config option without any kind of help... is kind of
strange. Remote processors could also mean some kind of distributed
computing...

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 8f9cf0b..a5e8880 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -7,6 +7,9 @@ config REMOTEPROC
 	select FW_LOADER
 	select VIRTIO
 	select VIRTUALIZATION
+	help
+	  Support for remote processors (such as DSP coprocessors). These
+	  are mainly used on embedded systems.
=20
 if REMOTEPROC
=20
@@ -25,11 +28,11 @@ config OMAP_REMOTEPROC
=20
 	  Currently only supported on OMAP4.
=20
-	  Usually you want to say y here, in order to enable multimedia
+	  Usually you want to say Y here, in order to enable multimedia
 	  use-cases to run on your platform (multimedia codecs are
 	  offloaded to remote DSP processors using this framework).
=20
-	  It's safe to say n here if you're not interested in multimedia
+	  It's safe to say N here if you're not interested in multimedia
 	  offloading or just want a bare minimum kernel.
=20
 config WKUP_M3_RPROC

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhXpuoACgkQMOfwapXb+vIliACeOw6vDVEYg2rzCoD/Kitrq2t1
kmYAoIxiiX3Bf6HJ7yZ45C7+e8p5fPRA
=RrRW
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
