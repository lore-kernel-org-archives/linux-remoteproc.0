Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 7 Dec 2016 14:09:33 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 10/10] virtio: enable endian checks for sparse builds
Message-ID: <20161207140933.GF32099@stefanha-x1.localdomain>
References: <1481038106-24899-1-git-send-email-mst@redhat.com>
 <1481038106-24899-11-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GLp9dJVi+aaipsRk"
Content-Disposition: inline
In-Reply-To: <1481038106-24899-11-git-send-email-mst@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowang@redhat.com>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@fb.com>, Neil Armstrong <narmstrong@baylibre.com>, Asias He <asias@redhat.com>, linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-scsi@vger.kernel.org, v9fs-developer@lists.sourceforge.net
List-ID: <linux-remoteproc@vger.kernel.org>


--GLp9dJVi+aaipsRk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2016 at 05:41:05PM +0200, Michael S. Tsirkin wrote:
> __CHECK_ENDIAN__ isn't on by default presumably because
> it triggers too many sparse warnings for correct code.
> But virtio is now clean of these warnings, and
> we want to keep it this way - enable this for
> sparse builds.
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>=20
> It seems that there should be a better way to do it,
> but this works too.
>=20
>  drivers/block/Makefile          | 1 +
>  drivers/char/Makefile           | 1 +
>  drivers/char/hw_random/Makefile | 2 ++
>  drivers/gpu/drm/virtio/Makefile | 1 +
>  drivers/net/Makefile            | 3 +++
>  drivers/net/caif/Makefile       | 1 +
>  drivers/rpmsg/Makefile          | 1 +
>  drivers/s390/virtio/Makefile    | 2 ++
>  drivers/scsi/Makefile           | 1 +
>  drivers/vhost/Makefile          | 1 +
>  drivers/virtio/Makefile         | 3 +++
>  net/9p/Makefile                 | 1 +
>  net/packet/Makefile             | 1 +
>  net/vmw_vsock/Makefile          | 2 ++
>  14 files changed, 21 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--GLp9dJVi+aaipsRk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYSBgdAAoJEJykq7OBq3PIErIIALcfuXKP5HgamgpQoZkN0Uc0
2n2uVTdzArmnFB44EWnkmW+iYjCl3HfmHgtoWPwsUKoY/RDBuL8x9wNSrOfDzSMf
ymjii6GPxe3fJ4xlvzAmueh0F4wfFeKl+jrO7jm3B1vIhJh6NzEgQZJgGxmpNYvE
X0o9IKPe5pr+x3ZAec1LMzsv9CvtJObwO3bVgAtQQlA7hlvewrbZkxgmKAojibGG
Mdv+oNGtpp8ePXN9c0EdhLFbPF3MY9YHf0DbirN5CXp7KP1GH9FgWaOKx0n0v8IB
3KqF7wUADa/eIWrIW1FaSy9DeGfihiwwrWaEcg/c0LoweS6OLwGhCJTXfp45GJk=
=SL7g
-----END PGP SIGNATURE-----

--GLp9dJVi+aaipsRk--
